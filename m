Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD06A2F7A
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379F5839;
	Sun, 26 Feb 2023 13:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379F5839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415870;
	bh=tXoBBwH1mWvTjMnK88lV0o+/UEzJ2oHsXRNStxiv+/A=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C4NwHzSZQDI2pTybR8xPQP55NqrIWeF+mhgmuMRfseVQyVVDljFK9JKG44HhurEdn
	 LH3f44fBOT9R4hExKLS23epuwOqHYDrSn+2wiNu/c85Gc/NT8QJe1WXT/xTNndgZqu
	 k0BPXoLw2lfUHJm2TUUjvxvGWbynUWH9JmYJVxfI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF000F8049C;
	Sun, 26 Feb 2023 13:50:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 118DEF804B1; Sun, 26 Feb 2023 13:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80B0EF800BA
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B0EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cY7wxPIk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBF3D60C1E;
	Sun, 26 Feb 2023 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51897C4339B;
	Sun, 26 Feb 2023 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415812;
	bh=tXoBBwH1mWvTjMnK88lV0o+/UEzJ2oHsXRNStxiv+/A=;
	h=From:Subject:Date:To:Cc:From;
	b=cY7wxPIkOJ9Su0CV/be3QlhZE0V3hA8nA3WxZNg5qSszdqcxG+bA2ylvtrMtt5Dn9
	 qpaI/FQuYJnSL2z99R17v9VNyWn1z9Ak5M5ELm9k5O89KCyS4u2b5bHWiFF8ojxfxq
	 MaKp5FDULs033FP2OF2w1CYqNhxmayozQN8SoNXYySl5WzNt5c4xxp7Mp/kP8G/U4a
	 r73cFb4fGtZXWjfXqQjzUO1FG3iWk2fU6gR6C3HDz7xVK6BhkLj6dYWTmvItlNhe7D
	 kmr412gVcDJ4/HgrCIQEFvSYMFqwiZPIlcItbL2T6504iAtQ//m2AjQ0OTWr+NoNFV
	 R7VlotBjMAtVg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: mt8183: Fixes from an initial glance at a
 kselftest run
Date: Sun, 26 Feb 2023 12:49:55 +0000
Message-Id: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNV+2MC/x2LSQ7CMAwAv1L5jKU2JaTiK6iHxBhqVSRgs0lV/
 07KcUYzCxirsMGxWUD5LSYlV+h2DdAU85VRzpXBta5vndtjtEJ4ew7d0OPjJTTjRb5sSJQC+UO
 g4D3UO0VjTBozTdv/KTpv+q7876s7jev6A0QTTneAAAAA
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tXoBBwH1mWvTjMnK88lV0o+/UEzJ2oHsXRNStxiv+/A=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhuTfoXXxNR2nlmlIJVTdS7pxMuNHXu8nl8XdL0paBfV+N/6N
 vryjk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYiKES+z/j2lY/pz4gvGuTOD/F6C
 eD0Dxp46TWpL/7GXIOFz3z1nsZmPyRsSh5AffHHieD3vCeACv9TL00/ayrCacOlKYs6pBYvfTNUw+b
 6z4r/zgt39K0WujIkfeuPCd3/7i1vH5Z5eaDGo++lM/c6Dvn3+Ku74UXDr6dd2lNamzw/gsHDilnb2
 BJTrqRqlvYZyDxKPv05CfvrLivWQb+fZ2vFF3omLVfvXLnmzxv0xLzeUYrZUxsRW9+LpH/99lpwa3i
 pqnneeri34l5L+n0WxW9+M7JGfs4fArXsRz6tdV1eY7bG6Ytu0OzgoLOnlmlcyL56J9IFV6hmgmaL1
 Y16/Iqz2R68XJdsM/epQqdpYLfAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: LJZ6A76VNJPIOMGOOUDZEVMTDJF3IYI5
X-Message-ID-Hash: LJZ6A76VNJPIOMGOOUDZEVMTDJF3IYI5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJZ6A76VNJPIOMGOOUDZEVMTDJF3IYI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a collection of fixes I came up after glancing through an
initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
on KernelCI.  There are more issues flagged, this is just what I fixed
thus far.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      ASoC: mt8183: Remove spammy logging from I2S DAI driver
      ASoC: mt8183: Fix event generation for I2S DAI operations

 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)
---
base-commit: d2980d8d826554fa6981d621e569a453787472f8
change-id: 20230224-asoc-mt8183-quick-fixes-ccb7c567c755

Best regards,
-- 
Mark Brown <broonie@kernel.org>

