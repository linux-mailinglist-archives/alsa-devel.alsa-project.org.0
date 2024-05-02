Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 735158B99D5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 13:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30FDBC0;
	Thu,  2 May 2024 13:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30FDBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714648453;
	bh=8yOR589ezBdkB5uNsMLgNtJ7R7IO8dRbDOHZynClA7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXKHCZPpw9prfSDqD+lWOKyjQo8C/hQZEEqsvMeCogPTTv55aXdlP8KkPxCzzedr9
	 wbstOfooin1fijcGL2ZsyCTHXyr61GHJTvP3MVcs8xBFQkhGVNtuOK2/Fa4KdGmnY9
	 jmlET59tOkRd4I5s4AsqsaskAqk0eN0ONV0dgQNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEFF9F805AB; Thu,  2 May 2024 13:13:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E377F805A1;
	Thu,  2 May 2024 13:13:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 853B4F80266; Thu,  2 May 2024 13:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F22E2F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 13:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F22E2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=ID/90LXS;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=ID/90LXS
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id EC48717106E;
	Thu,  2 May 2024 13:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714648403; bh=8yOR589ezBdkB5uNsMLgNtJ7R7IO8dRbDOHZynClA7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ID/90LXSCF9F2FtiViofiG7+kvdbZABSBn84qU/COWxIRo284KvdRRAFDDWnqVlJP
	 KByP3/pLZKcO+E0SxrES3rZJQRY8b/CIRZr4346Ng488QPVZuhmseR67mn3rOcZ+B5
	 qfMvLDpfSlbLtpotWAoxog/Awb9ML1JFB7g/0vcA=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGCN2RXQUkHd; Thu,  2 May 2024 13:13:23 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 194EE17106D;
	Thu,  2 May 2024 13:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714648403; bh=8yOR589ezBdkB5uNsMLgNtJ7R7IO8dRbDOHZynClA7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ID/90LXSCF9F2FtiViofiG7+kvdbZABSBn84qU/COWxIRo284KvdRRAFDDWnqVlJP
	 KByP3/pLZKcO+E0SxrES3rZJQRY8b/CIRZr4346Ng488QPVZuhmseR67mn3rOcZ+B5
	 qfMvLDpfSlbLtpotWAoxog/Awb9ML1JFB7g/0vcA=
Message-ID: <fff3893d-dfa8-87ca-abe1-63bae8a32626@ivitera.com>
Date: Thu, 2 May 2024 13:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
To: Chris Wulff <Chris.Wulff@biamp.com>, Chris Wulff <crwulff@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AKASH KUMAR <quic_akakum@quicinc.com>, Jack Pham <jackp@codeaurora.org>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
 <CO1PR17MB5419D45A1BDC2AFA22F60DD9E1142@CO1PR17MB5419.namprd17.prod.outlook.com>
 <0ba8963c-9b2a-f7aa-3c0f-296bdddac5e5@ivitera.com>
 <CO1PR17MB54198ECD1842EAF3CC79985FE11A2@CO1PR17MB5419.namprd17.prod.outlook.com>
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: 
 <CO1PR17MB54198ECD1842EAF3CC79985FE11A2@CO1PR17MB5419.namprd17.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TKSVRQHROFKZQLSDWGPSGC4T3FICHBSW
X-Message-ID-Hash: TKSVRQHROFKZQLSDWGPSGC4T3FICHBSW
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKSVRQHROFKZQLSDWGPSGC4T3FICHBSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 30. 04. 24 20:51, Chris Wulff wrote:
>> Would it make sense to name the p/c_fu_name properties specifically
>> p/c_fu_volume_name, to leave name room for additional feature units?
>> Yeah, I think that makes sense. I will change it to be p/c_fu_volume_name.

Just a thought - maybe just p/c_fu_vol_name would be shorter without
loosing meaning, maybe.
> 
>> Please what does p/c_it_ch_name stand for?
> 
> This is the iChannelNames string from the Input Terminal descriptor
> "the name of the first logical channel" from the UAC1 spec.

Thanks!


>>
>> Maybe we could leave it to the userspace here too. In fact there are
>> already open-source clients which try to handle this master/slave
>> principle of the loopback and gadget basically in the same way
>> https://github.com/HEnquist/camilladsp/pull/341*issue-2267218348
>> https://github.com/HEnquist/camilladsp/issues/342
>>
> 
> I will take a look at the references you provided. I may have solved this problem
> in a different way and maybe there is a better way to handle this.
> 
> The primary use case for the USB gadget interface of the products that I am
> working on is to interface with UC clients (like Microsoft Teams or Google Meet).
> 
> My basic problem is that I'm using alsaloop to connect the UAC gadget to a
> second ALSA interface. I ended up making modifications to alsaloop that
> keeps it running correctly when the host starts/stops audio on the USB interface.
> Without doing that I was having trouble with dropping the start of speaking
> or high latency when the USB host decides to start streaming audio because of
> the time required to get alsaloop running again after getting notified that a
> different alt mode was selected.

I see, this is a common problem. In fact that linked CamillaDSP
discussion has partly the same motivation - to avoid having to restart
the whole process, to keep the latency down and loose as few initial
samples as possible.

> I do still have the plug plugin in the pipeline
> as well, so this does result in a double conversion with how I have the UAC
> gadget driver currently doing sample size conversion.
> 
> If we allow userspace to handle all the rate/channel conversion (which does
> seem like a cleaner approach and is what I initially was trying to do), I think that
> would mean advertising multiple bit depths/channel counts in the hw_params.
> That part is pretty easy.
> 
> Then the userspace program can pick which to use, but what should we do
> with the sample data to/from USB if the userspace program picks a different
> combination than the alt mode currently selected by the host?

This is a very good point! I did not think about it. Using the plug
plugin provides all the conversions necessary but hides the information
about the original hw values.

That would perhaps suggest to really add the alsa read-only controls
informing about required (and only allowed) channels and format, just
like aloop does
https://github.com/torvalds/linux/blob/0106679839f7c69632b3b9833c3268c316c0a9fc/sound/drivers/aloop.c#L1588-L1611


> 
> Perhaps just discarding audio when the ALSA and USB formats differ would
> be the right thing to do here.

Can the USB format (incl. samplerate) change without going through
altset 0 first, i.e. without explicit stop of the stream? A client
subscribed to the Capture/Playback Rate ctl notifications will learn
about this event first.

Currently the u_audio.c code just sends the ctl notification in
set_active(). There are cases in alsa drivers where change in incoming
spdif rate stops the stream too, e.g.
https://github.com/torvalds/linux/blob/0106679839f7c69632b3b9833c3268c316c0a9fc/sound/i2c/other/ak4114.c#L589-L597
. I vaguely remember this was discussed when implementing the current
u_audio solution and no support for stopping the stream was given. Maybe
it could be optionally enabled with some config parameter. It may make
it easier for the clients, otherwise they get stuck and wait for timeout.



> I might be able to solve my latency/data chopping
> issues instead by reconfiguring the ALSA pipeline in response to the change
> of the ssize ALSA control (or uevent). I think a fair bit of my time delay was
> re-launching alsaloop. I will experiment a bit with this and see what I can get.

IMO the final solution to the latency/data chopping issue should avoid
the restart of the loopback software (be it simple alsaloop or complex
CamillaDSP). Nevertheless IMO the device will need to be re-opened
anyway because hw params were changed. The gadget should facilitate this
goal, ideally.

Maybe a reasonable way would really be to offer the alsa ctls with
required params and let user decide if the conversions will be provided
by the plug plugin or by his client internally. E.g. a client natively
capable of 48k-multiples could accept these rates directly and let the
permanently-inserted plug do automatic rate conversion for the other
rates, no change in client configuration needed -> no client restart.

The question is (if this path was chosen) whether all of the controls
should notify (like they do in aloop), or only the rate one (which
always gets changed at any format change as the gadget must go through
set_active(false), IMO. I do not know what overhead the extra
notifications bring but every reduction counts :-)

>>
>> Are capture and playback alt modes dependent? I thought they were
>> separate configurations but I may be wrong.
>>
>> If they are separate, perhaps p_alt.X and c_alt.X dirs would make sense
>> instead, with using non-prefixed properties within them (ssize, ch_mask,
>> etc.). I.e. p/c_xxx on the main level (setting the defaults and default
>> alt1 for each direction) and non-prefixed properties in the actual
>> p/c_alt.X subdirs.
> 
> They are indeed separate. I like this idea. I will separate these into c_alt.x and p_alt.x
> which can be created separately.

Again - hats off to your fantastic effort.

Thanks a lot,

Pavel.
