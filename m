Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48244738372
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628FF823;
	Wed, 21 Jun 2023 14:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628FF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687349786;
	bh=BWNYdCQNfYbOwWFOOqojtVq9yKl779+HZWfA1Uh2z3M=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=grLDt3SUiVY/FxEjJm5C94Vl9YERBUSCaCybweJ6MJpCCE27KIIF4LPq6Yi42JvIt
	 9J5kn89WZkKqo2W1jHT48fnJFwBguyyLcwhgPF+brIcyQU4Q5NToS6UGCUm7Z4xXOX
	 cxdBauA0NNzNGSUeBsf3TbU2+qHHQTYIIfVOeAUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31BF1F80132; Wed, 21 Jun 2023 14:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A45EF80132;
	Wed, 21 Jun 2023 14:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50EDBF80217; Mon, 19 Jun 2023 11:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 504CCF80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 11:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504CCF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ifx0mnry
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3112c11fdc9so1405645f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 02:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167938; x=1689759938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg5fyMPNnhaYlCgPT+RQHkxkEw/BblxkkUDcQhx50UI=;
        b=Ifx0mnryKOC6PtwitReKj+0hIqMwU2MSk+29dFX+l56ow0X8CUR+LgX0DJKbyo3d+H
         rzSIHSeox2/3nY/ruYRr2N+PHpsGqA8tjJ3psCZRBf9t5lpNRf835eLErcIHsLsZcOl1
         bWdNa91BCoj7PTSKnVMiBpuvqDNdiTdZ4iWfc3A+T9hcab4UtvNc9x5uhzjVSbxnF2vi
         cuFzYZE8vnCCJi8l3LejqFJ2yCD2DomyazKKT6yZc2l63skhPad+GGyEPGMEuhlG4Vgm
         VkPGMVjvGLf9a4mr49aZBk6uvPmlZthBuGtsSdJqEspe87dJ/X0GbuRCIf5hK1+yWGq7
         3vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167938; x=1689759938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bg5fyMPNnhaYlCgPT+RQHkxkEw/BblxkkUDcQhx50UI=;
        b=DQIHu1XI51V0qZQ+6dCk4i2YUXXEPMmPmto+6OaGurK5h4dzgu2jyUNDZnjMe80kBK
         M8Rz7I91rGcosZKSX/hwGseR+LAm5vD61tpPnibSccff4KOEcNElzDuqQ5jg1yHm+y7j
         kyz6p/5FJYQh8xkf/fbJBAEy/LV/x0BmrKJBs7703iftMXukWOP6FjhxIrTstmwQ51JK
         aLdSJjVFbzIpRY+fh3JVRZhkh39hXHkoQ4cWbuPWt+SS4xnoPqXVmxeJUsdXbX8k+0tz
         6QY8czGBVbxT4235PVC5jK8kMTIyV9QvgY9r4mt3BYJAgPYMUTHVSgFzqvE/QqO8WRu2
         yjXQ==
X-Gm-Message-State: AC+VfDynU7WamedcArGdWnjbyQzzNOUjKzwBA3yncnRwtGdNS5Gyd/xd
	eT/Es2Xq/bfecMchSaHMdzBQPg==
X-Google-Smtp-Source: 
 ACHHUZ5EJx7xgI7MpP4cCD0zI85bOqyLaWTZ2yeQIWYLYH97e3PBEm7Z1GPQ4kMXlIOCjBQriHGn/w==
X-Received: by 2002:adf:f5d0:0:b0:30e:5b63:7487 with SMTP id
 k16-20020adff5d0000000b0030e5b637487mr6099603wrp.58.1687167938145;
        Mon, 19 Jun 2023 02:45:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b002fed865c55esm31114276wrn.56.2023.06.19.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:45:36 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:45:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mengyingkun@loongson.cn
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: loongson: Add Loongson ASoC Sound Card Support
Message-ID: <4ef86c3e-0bb1-41c4-bdee-ee52c17dc9b8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D2VWBI3QKQWGKT5FDT5VWXECYA5X67OV
X-Message-ID-Hash: D2VWBI3QKQWGKT5FDT5VWXECYA5X67OV
X-Mailman-Approved-At: Wed, 21 Jun 2023 12:15:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2VWBI3QKQWGKT5FDT5VWXECYA5X67OV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Yingkun Meng,

The patch d24028606e76: "ASoC: loongson: Add Loongson ASoC Sound Card
Support" from Jun 14, 2023, leads to the following Smatch static
checker warning:

  sound/soc/loongson/loongson_card.c:157 loongson_card_parse_of()
  error: uninitialized symbol 'cpu_dai_name'.

  sound/soc/loongson/loongson_card.c:158 loongson_card_parse_of()
  error: uninitialized symbol 'codec_dai_name'.

sound/soc/loongson/loongson_card.c
    115 static int loongson_card_parse_of(struct loongson_card_data *data)
    116 {
    117         const char *cpu_dai_name, *codec_dai_name;
    118         struct device_node *cpu, *codec;
    119         struct snd_soc_card *card = &data->snd_card;
    120         struct device *dev = card->dev;
    121         struct of_phandle_args args;
    122         int ret, i;
    123 
    124         cpu = of_get_child_by_name(dev->of_node, "cpu");
    125         if (!cpu) {
    126                 dev_err(dev, "platform property missing or invalid\n");
    127                 return -EINVAL;
    128         }
    129         codec = of_get_child_by_name(dev->of_node, "codec");
    130         if (!codec) {
    131                 dev_err(dev, "audio-codec property missing or invalid\n");
    132                 ret = -EINVAL;
    133                 goto err;
    134         }
    135 
    136         ret = of_parse_phandle_with_args(cpu, "sound-dai",
    137                                          "#sound-dai-cells", 0, &args);
    138         if (ret) {
    139                 dev_err(dev, "codec node missing #sound-dai-cells\n");
    140                 goto err;
    141         }
    142         for (i = 0; i < card->num_links; i++)
    143                 loongson_dai_links[i].cpus->of_node = args.np;
    144 
    145         ret = of_parse_phandle_with_args(codec, "sound-dai",
    146                                          "#sound-dai-cells", 0, &args);
    147         if (ret) {
    148                 dev_err(dev, "codec node missing #sound-dai-cells\n");
    149                 goto err;
    150         }
    151         for (i = 0; i < card->num_links; i++)
    152                 loongson_dai_links[i].codecs->of_node = args.np;
    153 
    154         snd_soc_of_get_dai_name(cpu, &cpu_dai_name);
    155         snd_soc_of_get_dai_name(codec, &codec_dai_name);

It looks like snd_soc_of_get_dai_name() can fail but I can add an
exception for that if it never fails in real life.

    156         for (i = 0; i < card->num_links; i++) {
--> 157                 loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
    158                 loongson_dai_links[i].codecs->dai_name = codec_dai_name;
    159         }
    160         of_node_put(cpu);
    161         of_node_put(codec);
    162 
    163         return 0;
    164 
    165 err:
    166         of_node_put(cpu);
    167         of_node_put(codec);
    168         return ret;
    169 }

regards,
dan carpenter
