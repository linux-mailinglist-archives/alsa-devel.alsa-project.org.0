Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0A4983A0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 16:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC4C28B9;
	Mon, 24 Jan 2022 16:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC4C28B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643038505;
	bh=B78GEVXEZCdf9SrbgpzHbe0Ya2IRFMpiKwTAyuYNcUc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y3advwjp2yojjOguaP8JpzHhUzabkF3d4F5LhwAoffD92+uKEoOl2Jt0pKiUzTFuw
	 oE7Uxe3h6RRfpU6jl2JkWSONq6/il0g7oBmi6Wppb5F6qdfG2BXew89RXrwFquIIXu
	 wzd7OUH9eSQj/xl6SRlG/XF1vUPhTBSgyVwevDp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ADCEF802BE;
	Mon, 24 Jan 2022 16:34:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C12F6F8027C; Mon, 24 Jan 2022 16:33:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D66EF80161
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D66EF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NvwRRXhZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 561EE6148B;
 Mon, 24 Jan 2022 15:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EFAC340E1;
 Mon, 24 Jan 2022 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643038431;
 bh=B78GEVXEZCdf9SrbgpzHbe0Ya2IRFMpiKwTAyuYNcUc=;
 h=From:To:Cc:Subject:Date:From;
 b=NvwRRXhZtOcfs7M5Z6n4Lnc6hn+WAAodjldZ2d7x1KEdSJCtkkbt2kUHd75NfG/r3
 dupcNc4B97QbC+4fZCoPIbtcS5/wo8CkglZh5ML33qCGI52BOwXXo5lqbrrDza+L/t
 35IW49vBNCZ5Rk8eSDwxhEAmS6z2T/6xq/7pVPj5MYJrvVHbiek74q8KjCs4qpigzN
 poPrSkNdFuwzXTA+T8HcUk5yTDfaUjvSc4f/INl4i/XrgPAbH7fdSn6P3otFxDvnlo
 uo8INOyuBI5fMZA54YoMWex/3MYZJ2+4Au4RXaUBErM/Eg/iXZ3QCa+L06GP0Ctdbw
 VCsp0ZkjxbFTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 0/3] ASoC: Add bounds checking for written values
Date: Mon, 24 Jan 2022 15:32:50 +0000
Message-Id: <20220124153253.3548853-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=531; h=from:subject;
 bh=B78GEVXEZCdf9SrbgpzHbe0Ya2IRFMpiKwTAyuYNcUc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh7saiBnHAmjStxv/bGpjyE4viHY4/6J86BYjlmv5b
 2UlSGRyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYe7GogAKCRAk1otyXVSH0CFfB/
 99Qk8+DjGuq8a1BDLdokzpLEURSxnwtJxNSvHMTyCM316rWBMT7sDvtQ67aPMqgep2wfZoOOXTV+4i
 YNbQh8XOOi961EKo4zS+YR/k7b/sA4RjJvGMdNsXOthUcisl8CLb82jqx0p8OZknfHs4v61/VnZhMo
 NxfhJWPI3H3VnSbg/k7gImZRRZBxc24I/Nr2y0V/6RS4ykphP1GwxNw/95sltsiA+c2l4saU5+ZQov
 v4SgC+6n9n2oGH+JszVfZWQU2ZkntK0WCPcIAWrTufxrqsre/sAsLo0YZgVQKdjq7Ea60pjF7smpNv
 /8L2AMq5LznI2teaOjWm7dq6e6YUBS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series adds verification that values written to registers are in
bounds for controls since the core doesn't validate for us.

Mark Brown (3):
  ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
  ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
  ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()

 sound/soc/soc-ops.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.30.2

