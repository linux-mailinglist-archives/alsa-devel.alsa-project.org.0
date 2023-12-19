Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF913818FCF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 19:30:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B008DEA1;
	Tue, 19 Dec 2023 19:30:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B008DEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703010619;
	bh=HlwqgtvSrTjVToZOCBKZvemzsQLENFF7LO+JoWCPiec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tt6Z8z262PXwKbzELStfWzOsv3aPpolA3nApzgQAtD9xCBhjMcMQEJR3qrLjxgI8w
	 YvEXmmEkcHds+qIGjsmmvf2ArSEwJBQUPYv+fYD6G5c7vSPrvPc8m4NY+BFPmGgvhS
	 euj1Vig4MQU4OyHn3I+BQuOhaA3tVtZNlF1CXjjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5157BF80580; Tue, 19 Dec 2023 19:29:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DA81F8057A;
	Tue, 19 Dec 2023 19:29:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA1DF80425; Tue, 19 Dec 2023 19:29:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A038DF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 19:29:30 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9658AD09;
	Tue, 19 Dec 2023 19:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9658AD09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1703010568; bh=B2Jit5uu1ilfzhRsTm3ptCGtR1w9N+HM9N2D+xI95GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mT53RRaF81cmWn7cciW//DB3Y/CMqNAFNbI8OaQn7/JSgwMYRTeDWGCgeFojWVCJg
	 75xFSIJNep0OAmtk60hEY/qT3rNY0NkC2AgodaWmlB1zOqpglRO+JR/e2CjvFIjfpc
	 0CYECvfqzEapJNXLby/1tQXrp5hY2RPpXyTrpEwc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 19 Dec 2023 19:29:22 +0100 (CET)
Message-ID: <4ba79276-3b37-46ea-ad6f-805f51788c0c@perex.cz>
Date: Tue, 19 Dec 2023 19:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add basic support for
 cs42l43
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 mengdong.lin@intel.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
 <20231207095524.GM14858@ediswmail.ad.cirrus.com>
 <d3ed56d5-2b1a-4626-8b18-0f9c8bb48c73@perex.cz>
 <20231208120026.GO14858@ediswmail.ad.cirrus.com>
 <20231219164539.GB14858@ediswmail.ad.cirrus.com>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20231219164539.GB14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4UIUCZ7465YZKVU6S2XNRIMIVY7FYWKJ
X-Message-ID-Hash: 4UIUCZ7465YZKVU6S2XNRIMIVY7FYWKJ
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UIUCZ7465YZKVU6S2XNRIMIVY7FYWKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 12. 23 17:45, Charles Keepax wrote:
> On Fri, Dec 08, 2023 at 12:00:26PM +0000, Charles Keepax wrote:
>> On Thu, Dec 07, 2023 at 02:56:17PM +0100, Jaroslav Kysela wrote:
>>> On 07. 12. 23 10:55, Charles Keepax wrote:
>>>> On Wed, Dec 06, 2023 at 06:26:17PM +0100, Jaroslav Kysela wrote:
>>>>> On 06. 12. 23 17:46, Charles Keepax wrote:
>>>> Oh, I was not aware we could do that. I would yes much rather
>>>> handle the switches and volumes in this way. I will see if I can
>>>> figure it out, but if you had any good examples that already
>>>> exist that would really be handy?
>>>
>>> You may look for "LibraryConfig.remap.Config" and
>>> "Include.ctl-remap.File" strings in .conf files.
>>
>> Apologies still struggling to get this working. I think there must
>> some important boiler plate or limitation I am missing. Would really
>> appreciate if you could have a look at this and let me know if it
>> looks sane. I am starting out with just the simplest thing I can
>> think of, just trying to rename a control:
>>
> 
> Ok it seems starting with the simplest thing was not the best
> idea :-)
> 
> If you only have a remap, no map then it looks like one needs to
> do something like this:
> 
> +++ b/src/control/control_remap.c
> @@ -1192,7 +1192,7 @@ int snd_ctl_remap_open(snd_ctl_t **handlep, const char *name, snd_config_t *rema
>                  goto _err;
>          }
>   
> -   priv->numid_remap_active = priv->map_items > 0;
> + priv->numid_remap_active = priv->map_items > 0 || priv->remap_items > 0;

It's not a correct fix. I applied this quick fix with your Reported-by
tag:

@@ -148,7 +148,7 @@ static snd_ctl_numid_t 
*remap_numid_child_new(snd_ctl_remap_t *priv, unsigned in

         if (numid_child == 0)
                 return NULL;
-       if (remap_find_numid_app(priv, numid_child)) {
+       if (priv->numid_remap_active && remap_find_numid_app(priv, numid_child)) {

It seems that I did tests only with 'amixer set/get' commands and not 'amixer 
cget/cset' commands. The PA/pipewire uses the simple mixer API (set/get) so I 
have not noticed this issue. Thanks for reporting.

>> LibraryConfig.remap.Config {
>> 	ctl.default.remap {
>> 		"name='cs42l43 PDM2 Switch'" "name='cs42l43 Decimator 3 Switch'"
>> 	}
>> }
> 
> To answer part of my own question, and in the hope that if anyone
> else is having similar difficulties they will find this thread,
> the remapping works the other way around, it should go:
> 
> "name='cs42l43 Decimator 3 Switch'" "name='cs42l43 PDM2 Switch'"
> 
> With the newly mapped control second, kinda confusing as the .map
> sections do it the other way around, but fair enough.

The description for the alsa-lib's remap plugin is here:

https://www.alsa-project.org/alsa-doc/alsa-lib/control_plugins.html

> It would seem the primary issue is here, one needs to add:
> 
> CaptureCTL "default:${CardId}"
> PlaybackCTL "default:${CardId}"

Look for 'PlaybackMixer "default:' strings in configs for sound servers and 
PlaybackMixerElem corresponding values. Sound servers does not use the control 
API directly but the simple mixer API.

The LibraryConfig blocks are added to the standard configuration and there are 
2 ways to use them.

1) private configuration - _ucm####. prefix (only in memory for UCM apps)
2) blocks can be saved using cfg-save sequence command (used in 
ucm2/lib/ctl-remap.conf)

The second case - ctl-remap.conf - should save new configurations to 
/var/lib/alsa/card#.conf.d and the global configuration 
(/usr/share/alsa/alsa.conf) will include them. So the default devices should 
be modified. You may also prepare/test configs in ~/.asoundrc and then copy 
them to ucm configuration files.

Also note that the remapping is for the application side (API), UCM sequences 
are using the direct hw: controls.

Some notes are also here: 
https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/DEBUG.md

>> Also if there are any docs I should read happy to go there first?
> 
> Updating this to any suggestions on where to add some docs would
> also be appreciated?
> 
> Hopefully I can find sometime to document some of this a little
> and save someone else spending the quite large amount of time I
> have sunk into working this lot out so far.

Yes, documentation needs more improvements. The contents should go probably to 
https://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm__conf.html 
(ucm_confdoc.h in alsa-lib's source tree).

> Finally, does anyone have any idea what is going on with the
> current users of the remap. It looks like rt5660, rt5677, rt5651,
> rt5645, rt5640, rt5682 all currently have remap sections in their
> config. However almost the remapped controls are never used, which
> might not be surprising given the likely bug at the start of this
> email. But curious if anyone has any ideas that the remapping is
> actually being used for something non-obvious on those devices?
> Kinda wonder if we should just remove some of the unused
> remapping as I found it quite confusing whilst trying to figure
> this out.

The configs are for standard applications (case 2 - ctl-remap.conf).

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

