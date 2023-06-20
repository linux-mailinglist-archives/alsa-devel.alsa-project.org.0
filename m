Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F0738379
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B237884D;
	Wed, 21 Jun 2023 14:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B237884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687349866;
	bh=NB6hch5ImmnfE04+YJ5xyOd8gY1lSsMo73mirmWKa0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vZ5hZWVotjv5MRALHB49bCzcBqSGJQ8J60hQzEzUF+/BuIjsBBfWNJ0UCvnXkRoOV
	 vLRkX+HnmGeEOrgr+bGMopjU8stR7zjTR+Kqb9YDR0CzwZkkX12SKwoFciObZLexb8
	 rYlBeBtAmWPLWicnJkzhtfUuVQSE1XnGpUFLVKX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 319A1F805B2; Wed, 21 Jun 2023 14:15:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2BDCF805B1;
	Wed, 21 Jun 2023 14:15:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C664F80141; Tue, 20 Jun 2023 03:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 019BAF80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 03:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 019BAF80130
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Cxc+js_5BkdAIHAA--.363S3;
	Tue, 20 Jun 2023 09:25:01 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxK8rr_5Bk+AAhAA--.18635S3;
	Tue, 20 Jun 2023 09:24:59 +0800 (CST)
Message-ID: <3706a607-e498-5523-7b30-e649c7415bca@loongson.cn>
Date: Tue, 20 Jun 2023 09:24:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [bug report] ASoC: loongson: Add Loongson ASoC Sound Card Support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: alsa-devel@alsa-project.org
References: <4ef86c3e-0bb1-41c4-bdee-ee52c17dc9b8@moroto.mountain>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <4ef86c3e-0bb1-41c4-bdee-ee52c17dc9b8@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxK8rr_5Bk+AAhAA--.18635S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAIDGSQRYIIxgABs5
X-Coremail-Antispam: 1Uk129KBj93XoWxGFyftw1ruF4UAF47XF1fAFc_yoW5Ww1Upr
	sruas09r93tF1IvwnYqrWrAFWakry8AFZrJa1xKrn7CrZ5Za4DKw1fur1UZF4ayFy2yw42
	qrWxCa97Ka4DJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
	UUU==
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 332HXLZJLN462HLJ5SPNJTYD6YVIU6ZQ
X-Message-ID-Hash: 332HXLZJLN462HLJ5SPNJTYD6YVIU6ZQ
X-Mailman-Approved-At: Wed, 21 Jun 2023 12:15:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/332HXLZJLN462HLJ5SPNJTYD6YVIU6ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi dan,

You are right, snd_soc_of_get_dai_name() can fail, we should check its
return value.

I noticed that Kuninori Morimoto's patch removed this part of code.
please refer to link:
https://lore.kernel.org/alsa-devel/87352ndmlq.wl-kuninori.morimoto.gx@renesas.com/

As broonie's comments, the patch will be merged soon. If the patch is not merged
in the end, i will add a new patch to fix.

Thanks,
Yingkun

On 2023/6/19 17:45, Dan Carpenter wrote:
> Hello Yingkun Meng,
>
> The patch d24028606e76: "ASoC: loongson: Add Loongson ASoC Sound Card
> Support" from Jun 14, 2023, leads to the following Smatch static
> checker warning:
>
>    sound/soc/loongson/loongson_card.c:157 loongson_card_parse_of()
>    error: uninitialized symbol 'cpu_dai_name'.
>
>    sound/soc/loongson/loongson_card.c:158 loongson_card_parse_of()
>    error: uninitialized symbol 'codec_dai_name'.
>
> sound/soc/loongson/loongson_card.c
>      115 static int loongson_card_parse_of(struct loongson_card_data *data)
>      116 {
>      117         const char *cpu_dai_name, *codec_dai_name;
>      118         struct device_node *cpu, *codec;
>      119         struct snd_soc_card *card = &data->snd_card;
>      120         struct device *dev = card->dev;
>      121         struct of_phandle_args args;
>      122         int ret, i;
>      123
>      124         cpu = of_get_child_by_name(dev->of_node, "cpu");
>      125         if (!cpu) {
>      126                 dev_err(dev, "platform property missing or invalid\n");
>      127                 return -EINVAL;
>      128         }
>      129         codec = of_get_child_by_name(dev->of_node, "codec");
>      130         if (!codec) {
>      131                 dev_err(dev, "audio-codec property missing or invalid\n");
>      132                 ret = -EINVAL;
>      133                 goto err;
>      134         }
>      135
>      136         ret = of_parse_phandle_with_args(cpu, "sound-dai",
>      137                                          "#sound-dai-cells", 0, &args);
>      138         if (ret) {
>      139                 dev_err(dev, "codec node missing #sound-dai-cells\n");
>      140                 goto err;
>      141         }
>      142         for (i = 0; i < card->num_links; i++)
>      143                 loongson_dai_links[i].cpus->of_node = args.np;
>      144
>      145         ret = of_parse_phandle_with_args(codec, "sound-dai",
>      146                                          "#sound-dai-cells", 0, &args);
>      147         if (ret) {
>      148                 dev_err(dev, "codec node missing #sound-dai-cells\n");
>      149                 goto err;
>      150         }
>      151         for (i = 0; i < card->num_links; i++)
>      152                 loongson_dai_links[i].codecs->of_node = args.np;
>      153
>      154         snd_soc_of_get_dai_name(cpu, &cpu_dai_name);
>      155         snd_soc_of_get_dai_name(codec, &codec_dai_name);
>
> It looks like snd_soc_of_get_dai_name() can fail but I can add an
> exception for that if it never fails in real life.
>
>      156         for (i = 0; i < card->num_links; i++) {
> --> 157                 loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
>      158                 loongson_dai_links[i].codecs->dai_name = codec_dai_name;
>      159         }
>      160         of_node_put(cpu);
>      161         of_node_put(codec);
>      162
>      163         return 0;
>      164
>      165 err:
>      166         of_node_put(cpu);
>      167         of_node_put(codec);
>      168         return ret;
>      169 }
>
> regards,
> dan carpenter

