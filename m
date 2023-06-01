Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2071F138
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 19:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952C84E;
	Thu,  1 Jun 2023 19:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952C84E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685642297;
	bh=xQztXT/x2aRYB5EZD79TPtwInUuJDGHsH8vzR8uxbNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H0DFC5yksHtu4GdQ1wAGY8YlAqOu5ed0a2IRZpT2XNh1t0XbRknnDikCM6DIDMjRf
	 hrd4P+kw5XX5+ViKexMjp/Uq9sKCqHhLN3N0s4pUjZgggqbO1FQybnfr4rwAvsAyA3
	 QIWdx8l4wQ4XStt2CQn2UNgeiFwHEYPJ4S1VEPOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0042F80527; Thu,  1 Jun 2023 19:57:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 886A1F80132;
	Thu,  1 Jun 2023 19:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE1F1F80149; Thu,  1 Jun 2023 19:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr
 [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C8ABF80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 19:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8ABF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=gaAu0Hoi
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4mXxqV4hJZvWO4mXxqrkEg; Thu, 01 Jun 2023 19:57:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685642237;
	bh=7vt9+fLVrJ0DcwYcq+OdF4MOQmmWuiozZXmgqPSyP9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gaAu0HoiO+QyAxiOQKP1BGQtfBxDsExDWKFv/pCSfTswi3suLyp4hehNCsJ/IYNA3
	 QRd9xIN3lFZ5Hx3jD2P/fMLcQZ/tCA5gW38G3WQTIH9Hq3ImmwQcLA+5Cu/eapwSPk
	 ZmWmyQVIVw1HzA4efx2xUR1MGwImvTX0I807GB2gi4lunf5P7PwUv8nInUNPC50cC6
	 uNjuq582gY1Hv1UqopuJ/Z4BNTKzRA14ktud2dFDNgLn0CCsm6YKmpp/bFdzDHAVct
	 GYA6tk60qS2k9QWqzeTXZqjAmZ0JGuLxujS6ANiuETu+BnDEXeerlVv38k3P+fdxkK
	 uiPwdXV7rtqbg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Jun 2023 19:57:17 +0200
X-ME-IP: 86.243.2.178
Message-ID: <f3aa01d9-7dc5-ded4-1a9a-07634afc0726@wanadoo.fr>
Date: Thu, 1 Jun 2023 19:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed
 to kzalloc()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
References: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
 <2720a80a-4496-0ba9-e545-046ed2529f7d@linux.intel.com>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2720a80a-4496-0ba9-e545-046ed2529f7d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WEDUEEYEQZTPELUMBA72EGWKOYGOLB2U
X-Message-ID-Hash: WEDUEEYEQZTPELUMBA72EGWKOYGOLB2U
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEDUEEYEQZTPELUMBA72EGWKOYGOLB2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 01/06/2023 à 19:39, Pierre-Louis Bossart a écrit :
> 
> 
> On 6/1/23 12:30, Christophe JAILLET wrote:
>> struct_size() checks for overflow, but assigning its result to just a u32
>> may still overflow after a successful check.
>>
>> Use a size_t instead in order to be cleaner.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Based on analysis from Dan Carpenter on another patch (see [1]).
>>
>> [1]: https://lore.kernel.org/all/00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain/
> 
> looks like there are similar cases of struct_size -> u32 conversions in
> other places:
> 
> struct snd_sof_control {
>      u32 size;	/* cdata size */
> 
> ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
> scontrol->num_channels);
> ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
> scontrol->num_channels);
> ipc4-topology.c:        scontrol->size = struct_size(control_data,
> chanv, scontrol->num_channels);

My coccinelle script does not handle such cases.

> 
> not sure how much of an issue this really is though?

I agree that in practice it should be safe as-is, but it can't hurt :).
I don't know this code well, but should [2] be part of the call chain, 
it is obvious that it CAN'T overflow.


I checked for places where such pattern occurs after Dan's comment on 
another patch. I'll see if I find better candidates.


CJ

[2]: 
https://elixir.bootlin.com/linux/v6.4-rc1/source/sound/soc/sof/topology.c#L1404

> 
>> ---
>>   sound/soc/sof/ipc4-topology.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
>> index db64e0cb8663..50faa4c88b97 100644
>> --- a/sound/soc/sof/ipc4-topology.c
>> +++ b/sound/soc/sof/ipc4-topology.c
>> @@ -881,7 +881,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
>>   	/* allocate memory for base config extension if needed */
>>   	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
>>   		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
>> -		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
>> +		size_t ext_size = struct_size(base_cfg_ext, pin_formats,
>>   						swidget->num_input_pins + swidget->num_output_pins);
>>   
>>   		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
> 

