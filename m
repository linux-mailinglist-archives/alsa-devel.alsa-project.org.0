Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BC894BDF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAE42BE5;
	Tue,  2 Apr 2024 08:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAE42BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040830;
	bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XPH+Ws2Yhw7NM+Tf+bS7De2qQMMww7WpNxS07V5IKAKR5NfJrlBLdtrjl8RZIxyMY
	 hXRl9xfSZO/PI/Q9RQzG1AA9L4z0vgnDmYQQqQFtVEjrjmweXF9SQNk0dTWWhjDAGp
	 Ba8X7cXuiVN1Nmyq2P7/h91ROrqbXz31iZCKo7E0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3AECF80602; Tue,  2 Apr 2024 08:49:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52237F805F4;
	Tue,  2 Apr 2024 08:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FB8EF8025F; Wed, 27 Mar 2024 13:42:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E1DDF801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1DDF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aYYhhaZu
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a4a393b699fso134412566b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543371; x=1712148171;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=aYYhhaZuBpEwECBnOmEURfYSMfiWkpR49LvRuONufvBxaJF/uQEyNaw7BiFyILiWyE
         XiQoE+rqkyca9yd3Y9orLOnh5fxgZiVm3ZpsEJ7CdSdRs9gAfCgHUoSeLbj8GPv1DZnV
         /0CeOoa3QaMEMCzAMr7xVWye8bwCNLglpoUrm4GPw/4mW7x6g/MFaRQ/e0aKbOzwnuAK
         /3orjQEIlKiGjplkMfJ4/SoxnUosdu6XyHHUedRdLTd1ktJTa5l3aGi9qJnUcPFrY8fd
         pjVn+0zCzBiEvZbCIIqxaueUs8IUSrRR/86I/v1YdoL5fa5GVEqjwK53vEyzmbZ/pjKf
         FTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543371; x=1712148171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=N+TYXTYag8hNC4AQeyjfDH5JoySBaquTtQutp8uHEghhFm8BNhSJJjJjnISG+iXNeF
         WGHz4fwRTkwfjpVeymlBU6XLrLN4hornoW/5MUtR03zIJAbJee939L41KyrlOcCKxeZq
         qsRJmDIq3ykk3Xw/vjWpL6TfrPCCwp8CJyMo7LK8FGdxpRr9Y1VFiTAWRvuiPAz0yd+D
         QedDxS0E+9Aa/3WcBvyAF9YgND6myi8OBZDuxgB0LoED+y5YhIacnnX9F4FDJqoiM0wr
         UIVL/vfgFFm3eqAxh+QfNqshcn398Ie6RHmnIGXIsmcvTmq6CPQYxZ1izVkOaeeGNMTk
         IgqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU00W6pUgcWYK2JZH9lSi/2KR4QvMDiBLGEppKQ+DNT3eGw66CA/028Go04Wd883uxXEoEu34DTIm+MQ6Uxvtv98U2qgJh3oGR/Zo=
X-Gm-Message-State: AOJu0Yx6CNZ2PdWzi53eouSdxjRcrCs4cLMJ80/g7mcCUjirDe0g3zSw
	WKTJXkt5sOlSQ0ieE+fjGLL92AOMHNDHqm9wIh1X02ZbA7Y92bj+2AxtgM+nsPs=
X-Google-Smtp-Source: 
 AGHT+IG5vuCEMnJybNEU3pw6Dfhrha9UVjffnJEN9pSayVDfDg6+G0gg3OeqyhGazXN+XfbDGEL4yA==
X-Received: by 2002:a17:906:5645:b0:a47:34b5:fa6e with SMTP id
 v5-20020a170906564500b00a4734b5fa6emr3936509ejr.2.1711543370618;
        Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:57 +0100
Subject: [PATCH 04/22] bluetooth: virtio: drop owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-4-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPdBdOoV7iseHu8Ha4ifJV+o69aPjmkC0Glb
 hZvw0OYKhSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3QAKCRDBN2bmhouD
 1wI+D/9dbQLSRFm34TU4Qv7YYw/ixrbQYbzdht3LbG49prmr+l9PRN+lDKM5C7rVEcSei80vRnM
 TiW6KxYh0V1FcMmWftM5R3iPFwUdsjSJJ8STF9/qxCFrtRu4JF2jLy20hTeoVbp18elVq5cPQX7
 x0ZT+2U/6ejc+Tj67MUtextCGgzfAnxyzk869i8eMn5+xHxfOheEJYs56sRxZveNqcH02H3SJzS
 lVHZpxQrf3FRGgcwHAPt3T3Xdw8Z16tpAtE2x8gC688DaS1Xf+F0yjXhNYUD3TZ2Nf2LOIirHft
 RqrMloYSPBljyoR9aLzb+/TS3YpVgQlAvKN5d6tmlJ0nE9har9+fKbx2BcRrLp/6GDENjqsOo/l
 8CB/SP4BTOX5vsL5yzZ+pY00Qmxt0ejqUXPkWtmcx1XbG9w2k8k24TXnlZCPdLXrLhnZ2jI9LT+
 zBfzzDbBRNwOCPfTHDN6HNuuxYCdwPAnpCXF+I0jmGk74U4igIav9OArAmrq3hKZBqbWqOZI0BN
 vbbrFOmyQQ3Nr/FfhrtNyG373ZzkyCTApUHwmnIEwpxTiKH0m+OVNyP38BY9vsn1/ZkBfOPZZyU
 LMQHmHackK+l1II6lBOJVnPTDqc4EvqiFx/LJsVwQvunku2hC9omSwT9D4Wuv363XinjYsbSqRE
 G6BGGHfVkJ9lWYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: G6HG6FBP3SAFMZKNESV2DXRCRTY2PZZT
X-Message-ID-Hash: G6HG6FBP3SAFMZKNESV2DXRCRTY2PZZT
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:48:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6HG6FBP3SAFMZKNESV2DXRCRTY2PZZT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/virtio_bt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 2ac70b560c46..463b49ca2492 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -417,7 +417,6 @@ static const unsigned int virtbt_features[] = {
 
 static struct virtio_driver virtbt_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = virtbt_features,
 	.feature_table_size  = ARRAY_SIZE(virtbt_features),
 	.id_table            = virtbt_table,

-- 
2.34.1

