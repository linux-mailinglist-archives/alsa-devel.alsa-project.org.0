Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24544D7FFF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 11:38:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B81C18DA;
	Mon, 14 Mar 2022 11:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B81C18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647254310;
	bh=hWMwKpQJCKvQv8EqN/cC0MsL60FZLHQQH1uuj9Q2eSU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lhoW/awTpEbploKg1/DlNYz4nHkDbDxPLZp/2u/x0ibwEf6VX5LqfvCuvBlao2E/b
	 K3omCoo6X2BRaySvGpvwdc4OSACqw4Q6opkR+t9cdWT+Qc2wLmxJRJAuJ5xB2L56nk
	 HI/Ek9FR1Go41oteMSXIZTmQrID7AiPjJZaIhtK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0DAEF801EC;
	Mon, 14 Mar 2022 11:37:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E499DF80139; Mon, 14 Mar 2022 11:37:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-251-59.mail.qq.com (out203-205-251-59.mail.qq.com
 [203.205.251.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC47FF80100
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 11:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC47FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="El0dNCTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1647254226;
 bh=9Zh1V8PHB9LW8Q/vm2MDOYSA5hA0RUHKkZ1Rx574OAo=;
 h=From:To:Cc:Subject:Date;
 b=El0dNCTYQ8ToY+g0SqzkJ2vaWZcSMe0el8908OmVsMcuY5y4eNpPl8mLzEsH9IsRH
 QIQPbtHkzC+7EOBhOLbTOXLSNZtvLsk1ENnqB1GWwVZo+ZpiIpyNpM1dcKxayP77kd
 /dINwMziZ8RjYFlYCViB6yDj+/8Io+CKH52r6s4Y=
Received: from localhost.localdomain ([43.227.136.188])
 by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
 id 942A8224; Mon, 14 Mar 2022 18:37:02 +0800
X-QQ-mid: xmsmtpt1647254222tmu00snbw
Message-ID: <tencent_EC21778DC383823CBC4069EA9F0B84943905@qq.com>
X-QQ-XMAILINFO: MVKy59SpMLfUo3k1xaX1QzfgHUhMh8nppnBD0M4qC+XJPMIQlXgZgBTv3nb6Ha
 gy5C4fvCIgbP3XSmSORLepmkXgVEDfwuxexwcceZkGY4m1WFxFcorgsOqLMRMKzatEzMcqivsu0k
 c42EmTtf9+Y/q9s5sKlSnxUAXp/coEnWekNJ1bPaVpK6iXAQezCwGvT3nJP/ze5cyEai5HkocGJx
 9SumW4ZZHxGOoKb7cTnO/GKcbzkhwx3JhFjW4zoyWx0L6hEeO+xfqPRWx23X1yErITOwH11S7qwV
 3fDVc1fyL5vo/VokI9dTCqFBeRQr8Cut65GxCAAesmny/oHzBQ0p2OstDpRlAyBS3WrYX3ytbWz5
 VnG8wG2EeeB0iU4FkEQNUBssqJCWNjrlKpv1SZzGVszOuLefvLEgOzUsSAVvF2Gm/FVqjKlzL1ju
 xVeGOFLPCAovE1Nw6MyvoyD6Ggja2pvfx2dIMO0XyIMy2MHA9zO6EXZCaTbB6VBHkNRCsRVpjBtt
 BmVNAaKTrw8/v1X+4mdvw0Wl8R3jPUCFwqrBxJfQ+4hWOchI2Ra83NnfhuR2N0WsrtNqEsZq3zoL
 SbwR/JqgxJLC43qasxbXS+Nc32PCamwyOubVMryzIAJ24gwzX4/At2fRotcKNB60wXjumWB2lPuN
 G/z+ottul/vYVDUgBDZWFth8ccwBC7uV//0WeFs78qSHFsD3y38xv5eD38NNH3EnLfkJQPAiqFXM
 XX4VCQZUgTHGhGimJtLxz1RmXJbxLseLYaP4zBckxd8eSXi0oxn5UPrMQ1SJ03R+15pidPVmRkJ4
 T+hoD7S6LVFVXDRip079UXGOTi5sOTMpI0whrUn1J8bSGmpRDyD6CdR++263y+ZPcODqKax1kQur
 qxiH/vNIRB3m/7/MTvkgQS2GiWoxkRZs7cFett5LT3iElQk9ImWHfdyHoYqIL+3jMIPZ0B9JkgjF
 CqNDHEx64=
From: xkernel.wang@foxmail.com
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH v2] ASoC: samsung: i2s: check the return value of kstrdup()
Date: Mon, 14 Mar 2022 18:36:45 +0800
X-OQ-MSGID: <20220314103645.462-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 krzysztof.kozlowski@canonical.com, Xiaoke Wang <xkernel.wang@foxmail.com>,
 linux-kernel@vger.kernel.org
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kstrdup() is a memory allocation function which can return NULL when
some internal memory errors happen. It is better to check the return
value of it to catch the error in time.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the mail list and attach the tag 'Reviewed-by'.
 sound/soc/samsung/i2s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 309badc..70c8271 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1349,6 +1349,10 @@ static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
 		return -ENOMEM;
 
 	pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
+	if (!pdev_sec->driver_override) {
+		platform_device_put(pdev_sec);
+		return -ENOMEM;
+	}
 
 	ret = platform_device_add(pdev_sec);
 	if (ret < 0) {
-- 
