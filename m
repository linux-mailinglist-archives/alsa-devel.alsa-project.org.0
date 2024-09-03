Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60F9697D3
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 10:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1699FA4D;
	Tue,  3 Sep 2024 10:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1699FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725353518;
	bh=3BhA1rUCIQmh3+A+y5PlZ1SLcJ4ELnvZ0aDzwq6YqKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PkSyJQkrwx7i21J70XYkuW8c86vOmNCokstwemnRHo5V+YYXD1kp7gAuOjudMaiJ4
	 z1sgIDsKeQbL9EscjSgZFkST9QX4u3EKYz+kE+WufP8974K5qMI1TBnhEYJrOlOhrr
	 NGPAidGv1bJphumvmX/gzopuogF5/rvDI82WHc3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5C27F805B5; Tue,  3 Sep 2024 10:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F96F805AC;
	Tue,  3 Sep 2024 10:51:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E4E4F80199; Tue,  3 Sep 2024 10:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B8CFF80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 10:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B8CFF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CKNr5SWz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94694A41DBE;
	Tue,  3 Sep 2024 08:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD01C4CECA;
	Tue,  3 Sep 2024 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725353477;
	bh=3BhA1rUCIQmh3+A+y5PlZ1SLcJ4ELnvZ0aDzwq6YqKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CKNr5SWz3oRZU3sg7YygWaAp+wbO1WURD7BBs8zYFV43M8vZBB1Eyp2PyT5vssNZW
	 Ss4g10eJRsC6C4tFRC1eC3XjNyXuQrjLDID9coGIo7rBGAoIW3i6nVbZT794gs4hhy
	 71uus5W+UmfGbGfDqXbapcY9jrGMvL+tsyNq6o8Qi5lnm9XZdYTHi93rzkesji/9fh
	 ohghaOey9NRH1q6pOQD2u5CR4waYgk6q354RqiZoFuJTOYghBAmjOTpUznn5s/8MUf
	 9zRf+oYHC6WejJ/MTRhXyuKsivEefOTdhrFWrt62KpK561iRMNYiiE+N8YdhVMTynG
	 EX4fZsGYIDFsw==
Message-ID: <07d039e1-4f68-4f0a-94a0-a6389c545e89@kernel.org>
Date: Tue, 3 Sep 2024 10:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Application <application@irondevice.com>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <3gu6u7euavq272kaf2znmyn5p3rd3vupvqldvfxnq7nh5ul6jx@apwfcxvgkoyj>
 <SL2P216MB23372552D5345013CDEB43318C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: 
 <SL2P216MB23372552D5345013CDEB43318C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LTLVHCWMFSVFXBYSISCW7XS2OBDSAROF
X-Message-ID-Hash: LTLVHCWMFSVFXBYSISCW7XS2OBDSAROF
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTLVHCWMFSVFXBYSISCW7XS2OBDSAROF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/09/2024 10:33, Ki-Seok Jo wrote:
>> On Tue, Sep 03, 2024 at 02:44:33PM +0900, Kiseok Jo wrote:
>>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>>> ---
>>>  sound/soc/codecs/Kconfig   |    8 +
>>>  sound/soc/codecs/Makefile  |    2 +
>>>  sound/soc/codecs/sma1307.c | 2191
>>> ++++++++++++++++++++++++++++++++++++
>>>  sound/soc/codecs/sma1307.h |  454 ++++++++
>>>  4 files changed, 2655 insertions(+)
>>>  create mode 100644 sound/soc/codecs/sma1307.c  create mode 100644
>>> sound/soc/codecs/sma1307.h
>>>
>>
>> What are the differences against sm1303? Why it cannot be merged there?
>> You have entire commit msg to explain this instead of just sending empty
>> commit.
> 
> I will add a commit message in the next version of the patch.

and where is the changelog? Why do you send the same code as v2?

> 
> 
>>> +	unsigned int tsdw_cnt;
>>> +};
>>> +
>>> +static struct sma1307_pll_match sma1307_pll_matches[] = {
>>
>> const
> 
> Okay! 
> 
>>> +
>>> +/* DB scale conversion of speaker volume */ static const
>>> +DECLARE_TLV_DB_SCALE(sma1307_spk_tlv, -6000, 50, 0);
>>> +
>>> +static int sma1307_regmap_write(struct sma1307_priv *sma1307,
>>> +				unsigned int reg, unsigned int val) {
>>> +	int ret = 0;
>>> +	int cnt = sma1307->retry_cnt;
>>> +
>>> +	while (cnt--) {
>>
>> Sorry, but why? What is so broken in this hardware that it requires such
>> retries? Maybe just youro board is broken, not this codec?
>>
> 
> Generally, if there are no issues, retries shold not occur and it should execute only once.
> Could this be a problem?
> 
> I included the retries because there might be issues with the connection.

Write code in uniform style to the rest of the kernel. If there is a
problem, fix not only your but other users (BTW, might be already fixed
in regmap). Therefore if you do not see any other regmap I2C drivers
users doing this, that's a nice hint you are doing something maybe
unnecessary.

> 
> 
>>> +
>>> +static void sma1307_remove(struct snd_soc_component *component) {
>>> +	struct sma1307_priv *sma1307 =
>>> +snd_soc_component_get_drvdata(component);
>>> +
>>> +	cancel_delayed_work_sync(&sma1307->check_fault_work);
>>
>> Why do you cancel work in two different places?
> 
> 
> 
>>> +
>>> +	sma1307 = devm_kzalloc(&client->dev,
>>> +			       sizeof(struct sma1307_priv), GFP_KERNEL);
>>
>> sizeof(*)
>>
> 
> Sorry. What does it mean?


Adjust to existing kernel style. git grep kzalloc. It means use
dereference here.

> 
> 
>>> +
>>> +	ret = devm_snd_soc_register_component(&client->dev,
>>> +					      &sma1307_component, sma1307_dai,
>>> +					      1);
>>> +
>>
>> Drop blank line
> 
> Okay, When using 'Lindent', line breaks like this.
> I'll review and fix this.
> Thanks!
> 
> 
>>> +
>>> +static const struct i2c_device_id sma1307_i2c_id[] = {
>>> +	{ "sma1307", 0 },
>>> +	{ }
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(i2c, sma1307_i2c_id);
>>> +
>>> +static const struct of_device_id sma1307_of_match[] = {
>>> +	{.compatible = "irondevice,sma1307a", },
>>> +	{.compatible = "irondevice,sma1307aq", },	//AEC-Q100 Qualificated
>>
>> Drop, useless. Also does not match your I2C ID table.
> 
> The SMA1307A and SMA1307AQ are different chips with different device settings.
> Therefore, when registering in the devicetree, I intended to register the specific product and
> Cofigure the device settings accordingly.

Then why match data is the same? If it is the same, then most likely it
is pointless. Otherwise why the differences are not visible in match
data or usage of compatible? If devices are compatible, make them so and
drop it.

> 
> I set the I2C ID table to just 'sma1307' as shown.
> So, should I change it to 'sma1307a' and 'sma1307aq instead?
> 
>> Anyway, bindings are before their users.

Here you have answer to your other question.



Best regards,
Krzysztof

