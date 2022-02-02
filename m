Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62E4A78A8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC051768;
	Wed,  2 Feb 2022 20:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC051768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829902;
	bh=h6eJvmCnpqj2n/xEhcpCnVUlI36S7Z9EoGvB2KyaOKY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xao+t7RnI8HtUQj6PWSWO6fS6v+Dk+28IG00F+jRnfE0awtGH26dDpo+gWQ7i4b8j
	 5qmQqQSIOQdRNfvSjNHkr9UWVWT5KFwUsA/c207JzxNvG+tIC0MGH8V6piZ28t6ZMK
	 sX0qbTSG4SIGwsth1DdjFVL4j9fvZNQnZsgMSLWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55832F80095;
	Wed,  2 Feb 2022 20:23:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9BFEF80130; Wed,  2 Feb 2022 20:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CA3BF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA3BF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PhQbESFN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0B47B83255;
 Wed,  2 Feb 2022 19:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7988AC004E1;
 Wed,  2 Feb 2022 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829826;
 bh=h6eJvmCnpqj2n/xEhcpCnVUlI36S7Z9EoGvB2KyaOKY=;
 h=From:To:Cc:Subject:Date:From;
 b=PhQbESFNYiQxOPK/kN7h9GvWR5lZstQvDi8Iutt1ZL+ujTWGFAtqNS0fJ1mh8Q4jO
 IARAyEipfekXXHxvtAnbxDXFCWs2hDWSOOf/uRHfzibWUDfSfmLmxdG1pY5lv+AMOJ
 PnXpchfLiBUszqkkEFlKhPoCwuGzeHwIsIlAaiG8RCBR/S6mYGL9lgQtKw72qIzLSK
 2SbtBKzBMfQcy+sE4Gls3TEHylq6CX9kXYiY4A7q5M7/c1LgFP+EfnQ5gwmirk1nAq
 q0S7zkevNTI1zzZQGDpRWU8q7dyoSuaRqvNYHs3wBQtxhOdyVIJdBFYDjqIhdJ/KC3
 DqpsWVYxipjOw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 0/6] ASoC: Fix gpiolib dependencies
Date: Wed,  2 Feb 2022 19:23:27 +0000
Message-Id: <20220202192333.3655269-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=609; h=from:subject;
 bh=h6eJvmCnpqj2n/xEhcpCnVUlI36S7Z9EoGvB2KyaOKY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+tovlbZkHqXGYC3olPYQtT+I/q4MoX0jGYtfT+hK
 sB3AtZOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraLwAKCRAk1otyXVSH0DEYB/
 9ihkznqbdLZqXsexWUvWei3nK0SoST9q9J+7Ev4DICvA85Jc/kqcKXgWBD1f1zK7nl1X4RNJRmdqW6
 D3OXXkB5CMfTcPea3punIV/EM3fhbXLDYIaZq4mFR1fd0Ty+HWMBNgrsmUwX89Kwhi4JbVCuw8D1rq
 dx35ixb7H8OOaNITmAIjEiOoLapKDJ+fgXQoIQr49nXDTN3Coq9gY0/tOiVsv7taEiUgriBeL5XX1v
 xvyLSNWaCsOpl8wVWHdEg41+/Gg48pcoq/LU683EEFnEC8DyIjns2e0x4tbRT5cRpA591CckSj8THG
 IH06VSpwNILjRT3+SofVUJsYuupTG8
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

This series removes a bunch of spurious selects of gpiolib that were
causing noise in randconfig build tests.

Mark Brown (6):
  ASoC: dmic: Remove spurious gpiolib select
  ASoC: rt9120: Remove spurious gpiolib select
  ASoC: simple-amplifier: Remove spurious gpiolib select
  ASoC: max9759: Remove spurious gpiolib select
  ASoC: zl38060: Remove spurious gpiolib select
  ASoC: simple-mux: Depend on gpiolib rather than selecting it

 sound/soc/codecs/Kconfig | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.30.2

