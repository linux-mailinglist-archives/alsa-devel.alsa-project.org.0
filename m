Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09A99B37A
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2024 13:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CDDD84C;
	Sat, 12 Oct 2024 13:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CDDD84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728732465;
	bh=ozWgqL4UktxLyLZYhW3nptSMtJ/SZyukKb1lUVsTyb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l0PiJJ1XylaQsqPmXdlYhLY+L4R9zPCrFAj4ma5F7JMBrflKDEnEiEAj9diIFljnK
	 82Y9Y3fGxxRkeYTiICKQK3Rsf9iUZtPWh3WYtf6SyPnqSl0UPXJeZ1I7jRbkOOHvGi
	 5m+8D/iFCv9MuStxqu0NzXFYSN4R6Kiyelo6ujsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 011F5F805E7; Sat, 12 Oct 2024 13:26:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA89CF805C6;
	Sat, 12 Oct 2024 13:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19204F805E8; Sat, 12 Oct 2024 13:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B549F805E6
	for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2024 13:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B549F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lmOPj5zV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 655CF5C5670;
	Sat, 12 Oct 2024 11:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ADFC4CEC6;
	Sat, 12 Oct 2024 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732404;
	bh=ozWgqL4UktxLyLZYhW3nptSMtJ/SZyukKb1lUVsTyb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmOPj5zVFGU35vsUa9CRKLcTpx5Q7WQj+0L+u7tnIXM4zmtrQMhMSVHc3IIQtdgEs
	 SEa4PAb13MUP9uujGHPrxLG1T3brFWXjl/v9UPEnQOleNqYSIbOmhdQLp8+xfCwpRx
	 34Bbtr5sWvLM/XnuiBemC6dRDehWTHB4o/LBt4xi3EQZLPPRLj/fjJFQomsAVhKWzG
	 Mav4Z+/sSLSaexV/Q1w4uAZiwCUUfDqF2H6C/YuJ9ZC6dwDeKzyYd4HmkFIpsTOc11
	 kYZJ8xFfqb2UwuIkMHt6rRv7p6RhzqE2NTxbMv8/swZSN0Ky1f82gPlgyScAPQR+sH
	 TSqnoia0RdfQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 12/16] ASoC: qcom: sm8250: add
 qrb4210-rb2-sndcard compatible string
Date: Sat, 12 Oct 2024 07:26:08 -0400
Message-ID: <20241012112619.1762860-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3HYHJF7D6F7BSBNUXZXUVISCSXVHH72
X-Message-ID-Hash: F3HYHJF7D6F7BSBNUXZXUVISCSXVHH72
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3HYHJF7D6F7BSBNUXZXUVISCSXVHH72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit b97bc0656a66f89f78098d4d72dc04fa9518ab11 ]

Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20241002022015.867031-3-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b337..50e175fd521ce 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -166,6 +166,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb4210-rb2-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
-- 
2.43.0

