Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91267385CC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 15:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843526C1;
	Wed, 21 Jun 2023 15:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843526C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687355783;
	bh=agG/8FUIrxHf2oXgMPRNPIfa21jjKIMJZwhoQKUPOoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZsR5V55E8HPkgptvAtrQcFLjYaYOBDXW6+F4SKrEJcEbMoR5m4cAfmcr1q0/pNCFc
	 vEQ0EXepZJ+puOmJ9PTBfbB+08rYUgeJA4iV327jCo3FaH69/VAV3KAj9k8EysGY6Q
	 x8IsIAmLjoM3IyLKWl3nidYzTclIPa2+DsFVMATk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A436BF80124; Wed, 21 Jun 2023 15:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38911F80093;
	Wed, 21 Jun 2023 15:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 263E2F80141; Wed, 21 Jun 2023 15:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF9C5F80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 15:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF9C5F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=NseBKUSj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=egTp0AY9psN+AJQ1JWdPwx+Kv7FcC78T3v2Xv7lWJOM=;
	t=1687355722;x=1687445722;
	b=NseBKUSjLy0wPqWYfEmKxKrQGgeJ/v/tQSLHHITIQIPiR6JRSVpPurpHVRMlyuxWXkf7UtVxoHTQoS+C1cnpJJvNPrIK5cWLoHqTD46+L87scHZmkXxcLyuou18v/8WSR9n0DQ3lUiTU+qfrNsuboXtq6iqgkqj5gUBjuZvfA/s186h4Jbs0Orc+lqtSpFuYnnMkHhnP0z21qSyvcSxoH9j/O0/SElt8DCMh/Wiqvvun0aaWstjbO/dVrr0c0QsbuYC/QNf6yg/2ly87lzhW21TQy8mrE6j14kNUrWtrwwN/bk96OvQOoU+fL380USuqQmlW+BsVE+803PpvTHPXlg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qByIp-0004m1-OD; Wed, 21 Jun 2023 16:55:20 +0300
Message-ID: <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
Date: Wed, 21 Jun 2023 16:55:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
 <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDCD825FF3AA070ECA3C2EE242F31DB0C21182A05F538085040337AC357BF6EEABB9988C747EB46B660193D5CADA5827129BF3CD1B365EBDF45
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71EEA4C46C73542F4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C925DA674483BBE06C939DE9B875A2C06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BE2AB513042E4E129FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B28EC0646CDFC9FDDA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CAA44A86D94E7BBB043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A594830183E0ABDC774400005583E1DF52C85383A65BEFE8D5F87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF301C75078263B9F53E1ABAF2B3354ECD447C73019EA2B43811DCEFF45A5B21789EC5AF04A575AA6CC17492877F82D9B87DBC284F6F065DEA8667B7BB3EC1A8BA21BEC6C0C71ED4F84C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojw7uTMtz3/lzTNXQzEghHmg==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986BB548BBD549DD5DC872921BC9A27DD56798CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: TCK2N2RWFD3XYNALSDMFWNKJ4AWWMZIB
X-Message-ID-Hash: TCK2N2RWFD3XYNALSDMFWNKJ4AWWMZIB
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCK2N2RWFD3XYNALSDMFWNKJ4AWWMZIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21.06.2023 16:18, Mark Brown wrote:
> On Wed, Jun 21, 2023 at 04:02:34PM +0300, Maxim Kochetkov wrote:
>> On 21.06.2023 15:26, Mark Brown wrote:
> 
>>> This is configuring DSP A identically to left justified mode, it looks
>>> like the format configuration needs at least some interlock with the TDM
>>> configuration.
> 
>> According to datasheet MAX98090 supports only DSP_A (L data MSB after FRM
>> LRC) TDM mode. Allowing this mode will let us proper configure CPU audio
>> node via DT. Actual TDM mode activation is performed in
>> max98090_set_tdm_slot() via M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL
>> registers.
> 
> I'm saying there should be some interlock between these two settings, if
> nothing else setting DSP A mode should force TDM mode with automatically
> configured slot sizes.

At this time there is no any interlock for TDM mode in MAX98090 driver. 
We can specify dai-tdm-slot-* properties in DT and .set_tdm_slot() will 
be called to setup TDM mode. And SND_SOC_DAIFMT cannot affect it. I 
checked other codecs drivers: most of them performs TDM setup this way. 
So why do we need such interlock right now?
