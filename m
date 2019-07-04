Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF13601FE
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 10:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D1201694;
	Fri,  5 Jul 2019 10:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D1201694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562314660;
	bh=8qgdYnQtCw5oun+ee+IyreyOKNXO6TLBcudk0f3Po9I=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FKS5UDvmG5Os+dEyrat08wPlAse330rvnOD1Sm0LuavJKcotMz8q7CfnwDLqyHyHp
	 FFOOGcoMl8rzCAe1WUxbYFjJb8XkPRU9rBw34CqX+WmM93CyKvBakP9qj09ssjYIor
	 FjCmFP8oHTPO0a6warUREsuIY94Xz+3xP5gjeu6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6491FF80135;
	Fri,  5 Jul 2019 10:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856D0F80111; Thu,  4 Jul 2019 21:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C871EF80058
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 21:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C871EF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i89TR/RH"
Received: by mail-pf1-x442.google.com with SMTP id c85so3290079pfc.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 12:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=eoeEYOdEqIZcZNq9pmeZ1c/pJgF9dtMJSkeiYBAiydQ=;
 b=i89TR/RH7piu7X1G2CDukfVjSPIu/SqpUXrxtK/fbY++fQLTH+s6TUGWfRBi3Szjpb
 Ldv1rCeo/zE/Kueo63qiqWKBFb9+EFuzV/pC5Zs+hwFh38bOeBYVUSiZZ7mTagYabtnC
 SFgrzgyqiWfilRgSmuaUxIU6CM8OX81suJz5WaajShPmrQU9zF1aRxPOWvRFyjbt0+TP
 CGnhVDcxmLQbqj3XOysUoevjX70EP3d8H/SB7lymxT2oUradpMtkrLcfmreQn4PFyUYs
 SlqhJnrrTu7bk4HEqTdTpY9YGwpW/ZBtmoRlXeke14CHTzRsfLRnH+tXc+GH+wkmDUnN
 n5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=eoeEYOdEqIZcZNq9pmeZ1c/pJgF9dtMJSkeiYBAiydQ=;
 b=K03qSxkAieP67OmdN0Gr0EViX1m+V6OjcBgBaUPfK1YktFcryeL8aDOWUFb5ZHs5BX
 WHft02n9G38+XOnWAZK9BHlyfXbKEHy+xFQG5nQtR3CX0JhlnQJzmRKlOJTwCYriJ6IS
 zC5Ddx/Vn5mwJKB8c1xxqCD8EFdPyJdGYHP7L7VjKuDsUqVwwVC3j20aGfZXZ6KNLV/O
 68iU3gQ0gtUrNjZYvqGwuh/dLwaX2eOKK6xX8Hzn8llJdg7oWV9h/CZKjv3AvD8CYbxQ
 9e/7urQnxDmmz4Lw/SsAfr7zZhKEgjPBO3jjN3KKcUvpCpZezyB2lj275H0HDhxhetlb
 Ho8w==
X-Gm-Message-State: APjAAAX9W2CsxSnuqe36TB9fcL0mqGQREohiL6Y2QArFqaetAntOj8pk
 onYXgpuCNCs8vn5uYyUYx5I=
X-Google-Smtp-Source: APXvYqwrIftnJWSgTXCug1xbFEa+ugyQIaxmZrbO6htXQ9e08mEfTQxBLUkKBrxI+t6c488oVAYUQQ==
X-Received: by 2002:a17:90a:8a15:: with SMTP id
 w21mr1147947pjn.134.1562267434822; 
 Thu, 04 Jul 2019 12:10:34 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.81.29])
 by smtp.gmail.com with ESMTPSA id t2sm6702982pfh.166.2019.07.04.12.10.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 12:10:33 -0700 (PDT)
Date: Fri, 5 Jul 2019 00:40:26 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Gen Zhang <blackgod016574@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190704191026.GA20732@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 05 Jul 2019 10:15:13 +0200
Subject: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: add irqflag
	IRQF_ONESHOT flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add IRQF_ONESHOT to ensure "Interrupt is not reenabled after the hardirq
handler finished".

fixes below issue reported by coccicheck

sound/soc/codecs/wcd9335.c:4068:8-33: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 85737fe..7ab9bf6f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4056,6 +4056,9 @@ static struct wcd9335_irq wcd9335_irqs[] = {
 static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
 {
 	int irq, ret, i;
+	unsigned long irqflags;
+
+	irqflags = IRQF_TRIGGER_RISING | IRQF_ONESHOT;
 
 	for (i = 0; i < ARRAY_SIZE(wcd9335_irqs); i++) {
 		irq = regmap_irq_get_virq(wcd->irq_data, wcd9335_irqs[i].irq);
@@ -4067,7 +4070,7 @@ static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
 
 		ret = devm_request_threaded_irq(wcd->dev, irq, NULL,
 						wcd9335_irqs[i].handler,
-						IRQF_TRIGGER_RISING,
+						irqflags,
 						wcd9335_irqs[i].name, wcd);
 		if (ret) {
 			dev_err(wcd->dev, "Failed to request %s\n",
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
