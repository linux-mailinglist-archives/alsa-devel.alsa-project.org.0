Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E985D7C93CE
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09DFE9F6;
	Sat, 14 Oct 2023 11:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09DFE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275809;
	bh=VV26RQO4DDRaAS80Wb7haAtNZCTTq3P2sHT4gMUFOoE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SSuVERPo9KFlOsgFeBkLmD/5rxAtqblSE7IluFjJz+gnU+lpZxfxvpMk3tLDesIQJ
	 0pBnvsmK7HzcDRvFExpkqp7lnaYpBegYd0qJ3UQShJAyDLSdo5gXwuTSmzxYBlN+nq
	 IWBbWtseVSOPKNDQ6ebsRW2+lE0nAcMKdXhsD4WQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C35F805CA; Sat, 14 Oct 2023 11:27:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 346ACF805BE;
	Sat, 14 Oct 2023 11:27:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B98F802BE; Thu, 12 Oct 2023 15:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com
 [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C16DF8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 15:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C16DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=xIVqlAI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1697115799;
	bh=hvsAf3IGRqX1DpOH2B+0eu/3cS+DbSNmEVlnCQEwAPA=;
	h=From:To:Cc:Subject:Date;
	b=xIVqlAI+MMxWHV8Ql/OrHa1B2a9KW0AkuRe692cE4KFTPhzGM/0YN6tubED79I2vt
	 P1jj/JOi71l5ClqRCRKFOvYhDxMdNCnVE+/0N3Mfr5Al9RewW43uhLlcLmcABSXjwW
	 dVglKrq7NIhWWe/Veo8ighGwduHw9ucRdNGDsO1k=
Received: from KernelDevBox.byted.org ([180.184.51.134])
	by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
	id D0812F3; Thu, 12 Oct 2023 21:03:16 +0800
X-QQ-mid: xmsmtpt1697115796tm51ic8m3
Message-ID: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
X-QQ-XMAILINFO: MBbh9ZpQ5zEXVx6UGxhPICBGQ86jjAY9/rzQHXsVFdPVPnpl/tB3oiG+Emdu+m
	 Af8IFJAW+IPI+tPgqlogsl8cZSmYOfarhikPKuLw6GNlLlRBXiCzQ3yhJoc9g/KiwI3LWrptYut4
	 AT9EkS7Yq+6s6lHZ1IfYQHC5LHtxe+vDZs/fZQDr56MWt1WPT8QFxYseqKyC537yTXVML05U1OAn
	 rv+38rBztGRrs4gyx43dxflMJFiGm/nWOK/DTRXu0H8ybJzRXiw2o19n7wjqSjkuxAfj8b9xal/K
	 fXvSrzy31NuFEUTO462fB/ddtKCn8V1wDu3t+e+8zlcwnlrxerkk7abcOobEPDMNNK9AA0Yn1YdP
	 xgk++wJrDjRqf3YuOXmsFoeGiK7fG4B5CaVqH/EGN+kWf7e1kaUUy22aevWiidzJrTnWPX2aAqQ8
	 pgt1LXMdukqp3pZamL46HfVhssBkaIrOM5Uy6Gpazi5WK0lPzayrFNPDFLQ0cCxpvmKBDANQvjAP
	 qy98k1gLDddXVcyQEh/yCiECF2Ktbq67xY4q4xRMvkjilRurg7ZdNndvnOFTto9a7oB3I4A1puaD
	 fXNLBe9wo8gAmLwjnPfhK4vz96MGPGEP5T5cCQsCHH42wA2SKbPs+J2kw6AtQDBvLVeQrWU5JSyp
	 hAZ/+2gh805x6770Kz3SS7NmH8nPRNPZIAmSbHt/MRIILY98sSim/p/UJ8IThaQTeFuDkNor832D
	 TIOnCML28W+RWsXp2Isajvtym5vngbFEgSyeBTPpHEvtge0v8D3HB9+sYYuC5bbo8jQk5tCFgRDo
	 5J5esf0wjCJgPOXd+6GFzzrfHy5oovlBaofAjd/cV8t4BtWU3wa3S1xFJuVVFEntxGzhc2Ss4CLH
	 2EO+BCHIsKWmToWrgK1oiqhmazziU6zftAREhaphL2RL7D6pjy5T0jHXItmossKVd4h34D1210s3
	 FSixcSEUPCy1/ih1b+OaBXu2wPoUL+91Gp3KcJhFtNFaNOXyqHvV1NKYfP2vwO
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: shengjiu.wang@gmail.com
Cc: Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v2] ASoC: fsl: Fix PM disable depth imbalance in
 fsl_easrc_probe
Date: Thu, 12 Oct 2023 21:03:15 +0800
X-OQ-MSGID: <20231012130315.3292117-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhang_shurong@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KVEVCYY7BIEXYUHTN5CDH3ZTPYAS4VY5
X-Message-ID-Hash: KVEVCYY7BIEXYUHTN5CDH3ZTPYAS4VY5
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:26:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVEVCYY7BIEXYUHTN5CDH3ZTPYAS4VY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context. We fix it by calling
pm_runtime_disable when error returns.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
v1->v2: add Fixes tag

 sound/soc/fsl/fsl_easrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ba62995c909a..ec53bda46a46 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1966,17 +1966,21 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 					      &fsl_easrc_dai, 1);
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_asrc_component,
 					      NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC platform\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static void fsl_easrc_remove(struct platform_device *pdev)
-- 
2.30.2

