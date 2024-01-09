Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A657E828FF7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 23:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5F5E9D;
	Tue,  9 Jan 2024 23:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5F5E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704839559;
	bh=ClWKgLrErwgnsqKg9s7InPIW7JP59g8PIMc1o7Fmh3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NPKjaGDbCKReL3KL5IkHsaM0b9PIwnLlA/fO/dkfkdG1ZiLwLJ1XKxeqALAbl6zXZ
	 CuTW6e7E2qiczXSwRZzP1S4cq/gQfvLzCSyFCWWnSFHMEMN5IWRMF4SKIr1Ye8S+BR
	 92837Mlq/0vWa7KwDd4aeWMPwU9BsDTr3zwKnT1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 013F2F805A1; Tue,  9 Jan 2024 23:31:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B98FF80548;
	Tue,  9 Jan 2024 23:31:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5656FF80254; Tue,  9 Jan 2024 23:31:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB16F800F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 23:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB16F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bhobSueq
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3bbce1202ebso3315271b6e.2
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jan 2024 14:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704839483; x=1705444283;
 darn=alsa-project.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4LM2tcpDQbe/VXeTrQ3vh6Aow7A9aPJshodbKcPZnx4=;
        b=bhobSueqkceNoQ81Zk17G5LuYUhSu+ow2MMKKkoNckEnVQka2Whp2ErWR3+VihV8ZZ
         HU+LFmzraIL0FzHZd6rrBdUoCDemaZIn8IySXP8CLiwzS2YBR+mCOSL54qWSKA/9l1Ln
         fui5WaH9XJLQRCSLhIPxtf9AICXOPOQn3wwVGSNDqP8dMTDCt2z2dRVZxvqJTrXhMFj2
         alER9xM2NQ7tvNB+av71UiOSmwlxJ3B16t30mGzIDNiuxjcQge343ItYrT7ieRFHLXYX
         EF13tr6cAQMH3m6Po6e1RR0yZrp+xh8FjOH9GSao2nQ/w3M3O/6z0kLFBshxLaJZ1fmz
         06KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704839483; x=1705444283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LM2tcpDQbe/VXeTrQ3vh6Aow7A9aPJshodbKcPZnx4=;
        b=XJOemAYmFxg5eAif5WEN6X9H8oHVKtlytYeZtlBqXIQNLDnB9fF7cDvS83CJC0GrOg
         1DDKO4gcxl7Cc5672GmjhKh5oDl60wU4t+4PHHOFLay585v18R6JXMX0vYMZ/UuXmT1j
         ZuEsGpxS9iUFjPOBLfCQSP3FnqHdPdQ4Zk+RDogutrCoa+wpR2GG8VVHdxKHkhn92rpz
         7rz1u9pmqvLDdcs+ULOr4V/2Up2RoAu/xqlgY1dxf/f61hV3Ehpr8Q0MciFx+/xqoG81
         5BBc9YuJ/qSQzfCHD03C7b9eFyRJlADuKzfcYk16r9V0guvAOQo5ZyvpihczIKV5wgU2
         Kfng==
X-Gm-Message-State: AOJu0Yx8Waefi2A2dwXYAqPxPBiXj83E/6JlTjuDPGa8toy4bbbPVIKI
	/SgMrwt/OuVJneSIzBdKTeg=
X-Google-Smtp-Source: 
 AGHT+IFeGOFa6xfy0pKzOnBFaLp6N/drKJ3QnkjdLOsdi4+3g8yIJf4CeMOPwWpjFyp77eA+1TnhMA==
X-Received: by 2002:a05:6808:e83:b0:3bd:3a51:f6dd with SMTP id
 k3-20020a0568080e8300b003bd3a51f6ddmr110101oil.70.1704839483464;
        Tue, 09 Jan 2024 14:31:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1135:ca4a:123c:5e53])
        by smtp.gmail.com with ESMTPSA id
 q24-20020aa79838000000b006daf6892afesm2211283pfl.144.2024.01.09.14.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 14:31:22 -0800 (PST)
Date: Tue, 9 Jan 2024 14:31:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <Fred.Treven@cirrus.com>,
	Ben Bright <Ben.Bright@cirrus.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <James.Schulman@cirrus.com>,
	David Rhodes <David.Rhodes@cirrus.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Shuming Fan <shumingf@realtek.com>,
	Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	"moderated list:CIRRUS LOGIC AUDIO CODEC DRIVERS"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v5 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <ZZ3JNuLp-ZfGOQRF@google.com>
References: <20240104223643.876292-1-jogletre@opensource.cirrus.com>
 <20240104223643.876292-5-jogletre@opensource.cirrus.com>
 <ZZoFUwOEF6NByIp2@google.com>
 <564A2601-4933-4BD7-B4E6-C973A585CA61@cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <564A2601-4933-4BD7-B4E6-C973A585CA61@cirrus.com>
Message-ID-Hash: WISQ3JMBEUADEEVW6X7I72ZFQ7I7RRJJ
X-Message-ID-Hash: WISQ3JMBEUADEEVW6X7I72ZFQ7I7RRJJ
X-MailFrom: dmitry.torokhov@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WISQ3JMBEUADEEVW6X7I72ZFQ7I7RRJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 09, 2024 at 10:03:02PM +0000, James Ogletree wrote:
> Hi Dmitry,
> 
> Thank you for your excellent review. Just a few questions.
> 
> > On Jan 6, 2024, at 7:58 PM, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > 
> > On Thu, Jan 04, 2024 at 10:36:37PM +0000, James Ogletree wrote:
> 
> >> +
> >> + info->add_effect.u.periodic.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
> >> + if (!info->add_effect.u.periodic.custom_data)
> >> + return -ENOMEM;
> >> +
> >> + if (copy_from_user(info->add_effect.u.periodic.custom_data,
> >> +   effect->u.periodic.custom_data, sizeof(s16) * len)) {
> >> + info->add_error = -EFAULT;
> >> + goto out_free;
> >> + }
> >> +
> >> + queue_work(info->vibe_wq, &info->add_work);
> >> + flush_work(&info->add_work);
> > 
> > I do not understand the need of scheduling a work here. You are
> > obviously in a sleeping context (otherwise you would not be able to
> > execute flush_work()) so you should be able to upload the effect right
> > here.
> 
> Scheduling work here is to ensure its ordering with “playback" worker
> items, which themselves are called in atomic context and so need
> deferred work. I think this explains why we need a workqueue as well,
> but please correct me.
> 
> > 
> >> +
> >> +static int vibra_playback(struct input_dev *dev, int effect_id, int val)
> >> +{
> >> + struct vibra_info *info = input_get_drvdata(dev);
> >> +
> >> + if (val > 0) {
> > 
> > value is supposed to signal how many times an effect should be repeated.
> > It looks like you are not handling this at all.
> 
> For playbacks, we mandate that the input_event value field is set to either 1

I am sorry, who is "we"?

> or 0 to command either a start playback or stop playback respectively.
> Values other than that should be rejected, so in the next version I will fix this
> to explicitly check for 1 or 0.

No, please implement the API properly.

> 
> > 
> >> + info->start_effect = &dev->ff->effects[effect_id];
> >> + queue_work(info->vibe_wq, &info->vibe_start_work);
> > 
> > The API allows playback of several effects at once, the way you have it
> > done here if multiple requests come at same time only one will be
> > handled.
> 
> I think I may need some clarification on this point. Why would concurrent
> start/stop playback commands get dropped? It seems they would all be
> added to the workqueue and executed eventually.

You only have one instance of vibe_start_work, as well as only one
"slot" to hold the effect you want to start. So if you issue 2 request
back to back to play effect 1 and 2 you are likely to end with
info->start_effect == 2 and that is what vibe_start_work handler will
observe, effectively dropping request to play effect 1 on the floor.

> 
> > 
> >> + } else {
> >> + queue_work(info->vibe_wq, &info->vibe_stop_work);
> > 
> > Which effect are you stopping? All of them? You need to stop a
> > particular one.
> 
> Our implementation of “stop” stops all effects in flight which is intended.
> That is probably unusual so I will add a comment here in the next
> version.

Again, please implement the driver properly, not define your own
carveouts for the expected behavior.

Thanks.

-- 
Dmitry
