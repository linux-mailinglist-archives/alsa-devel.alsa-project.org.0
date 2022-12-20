Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0923652708
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 20:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB1A18D5;
	Tue, 20 Dec 2022 20:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB1A18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671564775;
	bh=3RH9NpTe5Gc0wAIVorjHbbomvQGBK/9hVXaTLg3w96c=;
	h=From:Date:Subject:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YF+w8ETBU2OWeCs4U7RZa+dBYPajooD79tcwb/BPYoscPFVBvyB7dW8w3eh9kPS4B
	 vLztahQJlcmrCJTnr8LYJXuKVtI3wZXAItqS3xZPpfaYdHd0A6dGNp5dFAv+O6Y6Wb
	 HcQbyW/7Dx0ug6xckujuJcqyROZaiX+JfoySbgok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7037FF8962A;
	Tue, 20 Dec 2022 20:12:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D613EF89627; Tue, 20 Dec 2022 20:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6EA5F89623
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 20:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6EA5F89623
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Zx+OZuhh
Received: by mail-ej1-x632.google.com with SMTP id tz12so31520788ejc.9
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3uLa8ajteDiOGAZvhSykFDlJdUftlgnCdSxpkuYzHko=;
 b=Zx+OZuhheM1p9U2+5vopR71SRR1nxKu4lrkIqgl78Bov1H+HUAB5ZDSXZXs9SVoDj7
 24cq+bs5bDjg8AaTEGkcquv01gGswnSfuff+agBK3WZwIQVqUrFOjXbM096BUo399oHe
 qwTC3aY8jRHk3/9ss84MRIHXCKPkJWjOhne0xJFu5ER1AbMQE32oEU5cljJEvYKhPBbj
 Yb4kgYttHycaN5q29OtKYRk/W9Y5zM41PT3Eio3ruU9pl2DnQi2ZSzDMWuFHphfnGatK
 9dbzXqNmvmylmfvUqsJ7qKHoodkZjeDVjqkzrJxcznSYFaH0h0kSMuEgfr+pZLNn5vvG
 uBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3uLa8ajteDiOGAZvhSykFDlJdUftlgnCdSxpkuYzHko=;
 b=T43AB+E800uOOfFOPYkOzqVs62pfbqQJ5t0Nge379gzQBqOorHUOxMVM7Mph5u02r0
 BXe3R5fAFJoJCNKMgtTN2NQy4pep/JWMsEitm0PNxKhZb4LABmYzIY+iXjjpisbMwHJs
 OzKN5ruykZCygvUJZelSc09MkkDNEMO/zDiJ+W1KGO6+wQuP1x7NYUy3zHrIjxABPh27
 lBBlFrZCcIa9ILkWqCX+LuOkxZMHEPte2aiq8E1mgP94adJiiprrsypJ4UTRrOKgQs3E
 ZsWH1GM85oK9HeKrRu362HUUATvSRTAR2ZgJlx9izukk8fqgtHTYvjfCW7kvpv3Vzo/r
 lSZw==
X-Gm-Message-State: ANoB5pk1PgqgBBBGoLB1ttuLNrq3TVmlMHKiaud1MBpRZfRvVD0nspSX
 xgJOB07QkWUd6NEQlHe19Q0=
X-Google-Smtp-Source: AA0mqf4G42KOa3Ptxy6uvUG11SslfIGCLi/gwTrjGgYou2MlvQJm+h7lZjPCnTVuhdZBPo9vyToY0A==
X-Received: by 2002:a17:906:c418:b0:7c1:5768:5fc9 with SMTP id
 u24-20020a170906c41800b007c157685fc9mr31576004ejz.43.1671563544739; 
 Tue, 20 Dec 2022 11:12:24 -0800 (PST)
Received: from [10.0.0.144] (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a170906539300b007c0efbaa8a0sm6059131ejo.4.2022.12.20.11.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 11:12:24 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
X-Google-Original-From: Emanuele Ghidoli <ghidoli.emanuele@gmail.com>
Message-ID: <9657ab8d-0c60-7c81-b1cb-8a5b43d07c40@gmail.com>
Date: Tue, 20 Dec 2022 20:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: wm8904 and output volume control
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
 <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
 <20221220100005.GD36097@ediswmail.ad.cirrus.com>
In-Reply-To: <20221220100005.GD36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/12/2022 11:00, Charles Keepax wrote:
> On Mon, Dec 19, 2022 at 04:20:10PM +0100, Emanuele Ghidoli wrote:
>> On 19/12/2022 10:58, Charles Keepax wrote:
>>> On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
>> I infer, from datasheet, that volume update is applied in different
>> way based on charge pump dynamic vs register control (CP_DYN_PWR bit
>> in CLASS_W register):
>> "Under Register control, the HPOUTL_VOL, HPOUTR_VOL, LINEOUTL_VOL
>> and LINEOUTR_VOL register settings are used to control the charge
>> pump mode of operation.
>> Under Dynamic control, the audio signal level in the DAC is used to
>> control the charge pump mode of operation."
>>
>> The second sentence do not explain that volume register is still
>> considered by the component but likely in a different way.
>>
>> It is important to note that I trace I2C transactions and, without
>> the patch, the CLASS_W register is written JUST after volume update
>> registers (with the patch is written before and after).
>>
>> At this point I have no doubt that we have to update that register
>> before writing volume.
>>
> 
> Hmm... I think my only concern here is this feels a bit counter
> intuitive, the default value is described as "controlled by
> volume register settings" and we are saying in that situation the
> volume registers don't seem to update properly. That is far from
> impossible but I think we should perhaps poke a little more to
> make sure we understand the bounds here.
I did some more test and I'm not 100% sure of what is going on anymore.


> I see that that CP_DYN_PWR bit is disabled when audio is going
> through one of the bypass paths. Would you be able to enable one
> of the bypass paths and see if you can manually adjust the volume
> on the headphone output, with a bypass path active?
With the previous change, I tested all the possible combination with one 
channel from the DAC and the other toggling from DAC to Bypass changing 
the volume and it's always correct.


> Would also perhaps be interesting as a test to completely remove
> the write to CP_DYN_PWR from probe and leave things set to manual
> and see how the volume behaves then?
When I tried to remove any write to this register my modification 
stopped working.


> I guess the interests here are to find out if the SYSCLK is
> involved at all.
I tested keep the clock always enabled, removing clk_disable_unprepare 
when going into SND_SOC_BIAS_OFF and it has zero effects.
Or did you mean something else?

Said all of that, I did one last test, forcing a volume update on
the charge pump enable callback, cp_event(), with this and only this
modification in everything is working fine.

Could it just be as easy as that the volume is applied only when the 
charge pump is already active?

 From the datasheet this seems a good explanation:

  The Charge Pump is enabled by setting the CP_ENA bit. When enabled, the
  charge pump adjusts the output voltages (CPVOUTP and CPVOUTN).

What do you think?

Emanuele

