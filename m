Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBE909E9E
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 18:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11CD7847;
	Sun, 16 Jun 2024 18:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11CD7847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718555991;
	bh=Ve8yIU93CqGV39jXDILXAr1Dw2HZhuoVS9gFsFaAPjY=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BA5Eu4Yady+KmyATfOlvI9r6UnU04iUp0BqW49NnE+vrh5thqcuoi0q7w3HIRKM3y
	 dxpkNF31UKSJqwn48W3rbKSI4lSf5kev9aql832yxtxi8E9slOF7X3xvqalgnxyWuL
	 HEGtYtelJL7v2YKF+ePAvgQsV7XZJwAZL1dGK68E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3632F805BA; Sun, 16 Jun 2024 18:39:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 591ECF805B2;
	Sun, 16 Jun 2024 18:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CE94F8023A; Sun, 16 Jun 2024 18:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6043EF800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 18:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6043EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=LRYU4Ya/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718555939; x=1719160739; i=markus.elfring@web.de;
	bh=wudiCjAOYzPYvYnle3vZvnR9d5fYg6NR06qnTJaJVK0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LRYU4Ya/NlKd7Ue3BC6ogTAICvgU+RRa9ZKQIFZKyE6ST0eN7mG+GQ1UXVW/5X9f
	 T2JQvdVjDcBE7uXeG3jpRDpP/kVpgUMz7Ol1bAUnvViSiah5tapnoJesX2WqTq/wU
	 zKCdtkDq7k19BiLMPyCZj0G97IMITHKS2g330UAos3y2NXzRs0vvS8wrFw0hhqPkY
	 vHfKBMxboFRt5E0mRkGifg4go1jSLaNfmd8IE9FICzmoJLgU2uuRB1dP2Fg/BBnq9
	 BcYh2J4oHr6kfmj5HTIK4A72iBe2dJd4NUrE3p6QacJ0KulLMNvekKCcRyTDKB1E1
	 rWnlWsAwxpy1884N9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nmq-1sJyJD2UqS-00FC0k; Sun, 16
 Jun 2024 18:38:59 +0200
Message-ID: <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
Date: Sun, 16 Jun 2024 18:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DxjFdTY6dURt0KEX55cU8ZQXbycMmIZXVImma0+UYHSWLc+e/Fp
 uofnWVfLZSwRA42OKWA49bvBypqU2bLZmL5Tm4RfVjZqJxGSma6umsikvlaSwdwT8STBOOU
 bjLAq/o/pt5Onqa0XiaTx8dR9gytaRtyQgPG73b6wYLQqpF8wC6XkfwZzgt2X9xQTxexBAl
 pzJTx6Xwd/XWG8QcYuBgQ==
UI-OutboundReport: notjunk:1;M01:P0:yMyHnsAA4Lw=;9MPvPvd28adjFquP7iieLl71KLY
 hT3k0TZ40I8hMXmZBOihrEGMPtQdxP/3gRIeK2aFeBy21jjAqqdFNf4JzUm2K8F9ZZhNMUaw+
 a1y1ld9aGoEMJTeF5+R9XwoqX4+qaebaxPxH9AdFs5x7rC2MQZryUcBwuMuuqTustPY3Z30Ni
 Rp9KB1sVGS+fjKUEcU4gmdbKx/3EU4fMQTnUjAGqzXNAepC3L40LXzUIakmKQ4Uvz5vYcM0FV
 FeFjkbB2urvG7h+9yHN54jFxtYVgYQJPMKQxLM+3AadJ65jeIEw2HfgIp8miRF7UBeqFnWAfw
 w5k8SVVn7t08yvg+6G0TFeEGnCthuTl3XTOqg8rKO5vg5Jkllo1A4nJqyIhi0QOaTITdw5h/Z
 HVL7aqyDsK1w5aG3jKzsQ4IDW0pfyl86GmTsbZox3pg6vgwwEKUSuuzxIDI7rC/hYGx018pjT
 M7TKifdfxCX+PUR33Ms01abxgv9DMewmbQRqZEk/aXmtcWkPpSpwo0m6pXnrZSXHs6FGysld2
 le2swTUllZ9P4Tq9b2D9eeEurFeabzr72abDmO2hNdVIYzIhA9eZUS5KUabjqgFe9XduGKmkm
 pDmtUs7SEImSX+Gyb951McPqMj0xa/7Y0wQbr85bmiX55j3f1TXolY0tYkwZaIxdNHUpSd/at
 gXC4QYo+mA+VRKNitlQzquM2omOtvyeBEmrG8/l3irWT/KToHycR9wrWhF0a8lrhUNxOfsJlP
 fJDG4406/B50iLFYVDy96tORt3OFSlypS1v9I4MXWMdtGxCMjCnr4dF+Xr8Wo7OnjNIwB45nk
 82hlsm102bNohgtfzb/tLtxPo/ZNw1/GAIw5LSktA+tzQ=
Message-ID-Hash: 24H6RL2NE5QDMDK7ABSZKZGZOWIN36YX
X-Message-ID-Hash: 24H6RL2NE5QDMDK7ABSZKZGZOWIN36YX
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24H6RL2NE5QDMDK7ABSZKZGZOWIN36YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> This patch adds basic SoundWire codec driver to support for
> WCD9370/WCD9375 TX and RX devices.
=E2=80=A6

Please improve such a change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94


=E2=80=A6
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -0,0 +1,1677 @@
=E2=80=A6
> +static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *c=
omponent,
> +					    int req_volt, int micb_num)
> +{
=E2=80=A6
> +	mutex_lock(&wcd937x->micb_lock);
> +	/*
> +	 * If requested micbias voltage is same as current micbias
=E2=80=A6
> +exit:
> +	mutex_unlock(&wcd937x->micb_lock);
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&wcd937x->micb_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus
