Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB26738456
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 15:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4FA14E;
	Wed, 21 Jun 2023 15:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4FA14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687352620;
	bh=wg64TFMQl2BVSb3Sv8yk+UbaLmiNEsOI2E+YA3t4AXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlq8uOlR0mOKEm0COd3SW2aN2VzeWX0sc1CW3rD/uVcgPzcG3RDdF6u6AAE1TqAo5
	 s+RAyeIdoFa6EzXYh8XuQZiMvegrH9UmZuhRFwvH9dPK09zk8fqWoUBlP9sgQe8alB
	 +sNrVojKKBBZlyzEuK46XLbhwfSeHDQi91hmMDcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4545F80544; Wed, 21 Jun 2023 15:02:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77DCCF80132;
	Wed, 21 Jun 2023 15:02:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4F03F80141; Wed, 21 Jun 2023 15:02:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B3674F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 15:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3674F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=fy9qoKqH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=wf/ICJJMrh33uKZt2UjF6jg7rnoHL8bjgikMojxBtZg=;
	t=1687352559;x=1687442559;
	b=fy9qoKqHDwOLKskzKfXKo/ZZ/mFrYaV+Y9vXmxe/16pPKlEoFvB6zjwsWHt6wWbqnmQnkUpmU3sRPhe6Rwn4dKlBoH9HF+G5oBNL0HMtXIqtfsCHGuASHwFRsvxDEOq9IksZ6jIhD39F7r2XJae+Sd3y5BZ4RhtGl/9scMPbcCgi8N4NeIGT78KOKQ0+d1+ARh+aZthB3HjaZ+wBwbd8hes47GsjCHQSQ3Q59epticOhilUZIaE3/ANq8fvtzUk+BPrIG2MwKzrqqdIFGlKftH14AYa28Brfec6lnwKvxyFQLtxetEA+Pzq0zeN8OFq3lJsYUGS1ayfKjPSEpo5mGQ==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qBxTn-0004zi-Ua; Wed, 21 Jun 2023 16:02:36 +0300
Message-ID: <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
Date: Wed, 21 Jun 2023 16:02:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
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
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDC5FE2F5E6723F70B2B5A8ACCF658560FC182A05F538085040AA0B343A63EE01F5A4E8A46848515318D86C0ED6992300058D30B3D0B87D82FA
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D05773942AAE9CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F28F4AF03526AA8F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8904A2E0E581E359577F9A7531E6D1F6A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC7A3838EBC35966AA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C837C4FEFBD186071C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A516FBFAE3D48BF3E42CD16C872D5DE090D9A08458193250ABF87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF324597BA0D9BF0B0DB18E3A3FBB90F1CF5C0A6F738EE4D34E2F6143D8209185C257E6C4F5EEB673EC17492877F82D9B87848E4DD801FB89E0C4EE6936448917121BEC6C0C71ED4F84C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojw7uTMtz3/lz6lVQdPRYW9A==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B41E1CDC64A4CD8BFE25CD2E9722F205C98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: KHVKHDKIJGRFMACETGQIUHVTABPFB6RF
X-Message-ID-Hash: KHVKHDKIJGRFMACETGQIUHVTABPFB6RF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHVKHDKIJGRFMACETGQIUHVTABPFB6RF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21.06.2023 15:26, Mark Brown wrote:
> On Wed, Jun 21, 2023 at 02:53:27PM +0300, Maxim Kochetkov wrote:
> 
>> TDM mode for max98090 is dsp_a compatible. So allow it.
> 
>>   		case SND_SOC_DAIFMT_DSP_A:
>> -			/* Not supported mode */
>> +			break;
> 
> This is configuring DSP A identically to left justified mode, it looks
> like the format configuration needs at least some interlock with the TDM
> configuration.

According to datasheet MAX98090 supports only DSP_A (L data MSB after 
FRM LRC) TDM mode. Allowing this mode will let us proper configure CPU 
audio node via DT. Actual TDM mode activation is performed in 
max98090_set_tdm_slot() via M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL 
registers.
