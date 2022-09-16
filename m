Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3F5BA6B1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A4C918F2;
	Fri, 16 Sep 2022 08:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A4C918F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309226;
	bh=CkZ1RfuQOJjjs2tmXj7Q4NLziDzZJVh06OEmPZDHyOo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a7PyfdfSzDYk3CdA8an0AmvsYn6sgDfsxNf78/b1mXeM48G1db/deKr/0UBGqhtVM
	 bVY5m0En2dqKrBMejWyv+ZOckGjdmahIdiiqBO6CTDfsyzGBet0kLgOqutSBRe8xSp
	 9ctmz7MQexX756WPhPfju64bBn53A3gl2iSCVkZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEACF800E5;
	Fri, 16 Sep 2022 08:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD23F8019B; Fri, 16 Sep 2022 08:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2944CF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2944CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ec7QuVfn"
Received: by mail-pj1-x102e.google.com with SMTP id
 q62-20020a17090a17c400b00202a3497516so17086173pja.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=avEn3txHBu3dTZu+mmCEsPcvkg2cCwT/97qBAx7lojg=;
 b=ec7QuVfnIZLQ88jHZoUqWHmt5Tz6VnOx+4TTQPJqAmjTWBV6Z4evvgj89nxPR/PnKv
 FxGznEljYvSw7kwOhi4jr7CxCiEY0Blo+TX/8Ta2xgp+ubxoMYeNbMGYJk4/KbQ4iAD5
 gOKxPIQg9fALFSIViKsJu6Fx2WC+d/r4/TPfMvYICGTDOiCvFQxsEMEt4suhqcN5+Upq
 vw0Easd/AnS0FnAKtSDGBcj/8in/IGWZqe39ihXqzObr5F9ZM7XmTLEexvQBMD89Ympz
 fm2GO6piOH4WnyN9IlLydw8Af0oBZngODg50dXPjoLKXsIL0X/p6XYKObS5sKeb68CnH
 C9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=avEn3txHBu3dTZu+mmCEsPcvkg2cCwT/97qBAx7lojg=;
 b=yBe7ODALnHdT84UExw+UzgtpOBpC1BE0eAgqWDJXljwXcmBLPv1F6jP6PGoVl1Yw+R
 vZcZbgDB5obNiv3T0JRREgztOHKPPk3OXM8NK9mGkmJIm+kLXC9mzyeFwXq+bYrmGFgn
 gP+kD2Z61ca5C4gxOR4+xWVZ8AADbovY/yui20DJTVaXD89/K1Dvuvs9C4B/qL+7YeK/
 dt6+dShZlANLXJ0SPw4CMzQ0YKt9euj9g7QRjW0HQ+7VQ6QIwNytYSw+eMamxifTQmZL
 z11xUWUuVIIyjJyiWRT8ZAZeKmAssPqh84cLW/2qXeQgxuyik2iospv73pUYifdztYfb
 g6bA==
X-Gm-Message-State: ACrzQf0DzPEEa2Tmx0Nqkkla1W8/mmnqCC1icyErlJ5OrW3Veme4seYG
 OJWn5BoiTz81UFQhscKoLoQ=
X-Google-Smtp-Source: AMsMyM7/HKAkkyHeAgmYan5gFHmSSBU5HgXDevyu/H/LYekwOwKnnaNMciTFeBFlUC/E0cTeDOZ5kA==
X-Received: by 2002:a17:90a:c258:b0:202:b93b:cb89 with SMTP id
 d24-20020a17090ac25800b00202b93bcb89mr14265611pjx.126.1663309152205; 
 Thu, 15 Sep 2022 23:19:12 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a170902c7d200b001745662d568sm13741358pla.278.2022.09.15.23.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:19:11 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: amd: acp: use devm_kcalloc() instead of
 devm_kzalloc()
Date: Fri, 16 Sep 2022 06:19:06 +0000
Message-Id: <20220916061906.152434-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, AjitKumar.Pandey@amd.com,
 venkataprasad.potturu@amd.com, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, Vijendar.Mukunda@amd.com, tiwai@suse.com,
 lgirdwood@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>,
 yangyingliang@huawei.com, Vsujithkumar.Reddy@amd.com
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/amd/acp/acp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index ef2ce083521e..a0c84cd07fde 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -107,7 +107,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto unregister_dmic_dev;
 	}
 
-	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * num_res, GFP_KERNEL);
+	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
 	if (!res) {
 		ret = -ENOMEM;
 		goto unregister_dmic_dev;
-- 
2.25.1
