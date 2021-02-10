Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3B31660D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 13:08:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AEE716D3;
	Wed, 10 Feb 2021 13:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AEE716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612958893;
	bh=p19qhdgBIKwdOoKdjZSMaJR2mGa2MLtrRkyT9XrlJ/4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUMOR/wizYFHiF9us2jcryoho6n7rYTwImURxl/398uG8P79a0UpBKGbAuqgqfFT7
	 /TfxHstMHmsKeY9GPzx8w3Grfh8RLF7lWahG7rvlXqXdLstxEJMwjGrTIincnQjySI
	 3raTqw9cW5rLlgOaex9FfQ6enQoM9meOB6brWrjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F6D1F8022D;
	Wed, 10 Feb 2021 13:06:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF966F8022B; Wed, 10 Feb 2021 13:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7138FF800F1
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 13:06:29 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 597EBA003F;
 Wed, 10 Feb 2021 13:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 597EBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612958789; bh=6CKi6awuC4mqOly0xuEsZjMUkQZCeOMWjH+jPQnhTrs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=catjFxjYyN70Nnm4fqfyU9GA9LZ2AjRwruKPQM3JcR+UjgpbL68xc+zVjS9+33D8J
 M4reyqzYVLnRMOA5QgdR/sQv9+LyWzlO6mgRjXOiepzsugxDralMgbzcShaWyhRuHs
 OAWWASCtL6ZYAadON3VbtnO+vJ5xQ+Cw/mQJkxaE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 10 Feb 2021 13:06:25 +0100 (CET)
Subject: Re: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
To: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
References: <20210207201157.869972-1-perex@perex.cz>
 <s5him72y4q0.wl-tiwai@suse.de>
 <3bc1b151-68ce-8408-aff1-aeba2e6fe4c3@perex.cz>
 <s5h5z32y0xt.wl-tiwai@suse.de> <20210208223443.GA258185@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <55b6d51e-6138-9ecf-fe55-c50f61d97a77@perex.cz>
Date: Wed, 10 Feb 2021 13:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208223443.GA258185@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 08. 02. 21 v 23:34 Takashi Sakamoto napsal(a):
> Hi,
> 
> On Mon, Feb 08, 2021 at 05:33:02PM +0100, Takashi Iwai wrote:
>>>> Also, are those new access flags exposed to user-space intentionally,
>>>> so that user-space gets some information?
>>>
>>> Yes, it's one benefit, the second benefit is that we can create user space
>>> controls for hardware which does not have any switch / volume controls for the
>>> given path.
>>>
>>> An example is the AMD ACP bridge with the simple digital microphones. We can
>>> use alsa-lib's softvol plugin to control the volume for this and it would be
>>> nice to mark this user space control with the mic mute LED flag.
>>
>> OK, makes sense.
> 
> I have a concern about the usage of access flag for such kind of
> hardware specific stuffs (LED dedicated to specific audio control)
> since it's not enough hardware abstraction.
> 
> In my opinion, for the case, developers for in-kernel driver tend to use
> specific name for control elements (or prefix/suffix of the name). Adding
> new access flags for it seems to be overengineering against the original
> purpose.

Unfortunately, the ASoC drivers do not take care about any abstract naming.
They mostly follow hw (codec) register naming from datasheets. So this rule is
no longer true.

> The patch itself includes some remarkable ideas that:
>  - introduction of association between control elements
>  - analyzing current status of the association (then operate LEDs)
>  - communication to userspace stuffs about the association
> 
> (here I carefully avoid usage of word 'topology'.)
> 
> The association itself seems to be useful when cooperating use case manager
> of alsa-lib. I guess that the kind of framework designed for the association
> is preferable instead of the patch tight-coupled to LED stuffs.
> (And some subsystem already attempts to implement such framework into kernel
> land, e.g. media controller devices in media subsystem.)
> 
> 
> In another side, I guess that the reason to supply the association to
> kernel land is to use 'ledtrig_audio_set()' kernel API. If userspace
> stuffs find target LEDs and operate them via userspace interface,
> the association could be in userspace. I think it better to investigate
> for the direction since I can imagine that the introduction of association
> to kernel land brings much codes into kernel land to support wide-variety
> of hardware (and going to be obsoleted according to lifetime of actual
> hardware sooner or later).

My goal is to:

1) reduce the code required to the LED support in the drivers
2) handle security - see the Takashi follow up; for very secure
   kernel configurations, the user space (non-root) should not "touch" the
   LED settings at all to have the right feedback; also UCM is a bit
   another layer on top of the other APIs

The user space solution was already a bit denied when the LED support was
added to the HDA driver (we can see the similarity for the vmaster code which
is another layer in the control code etc.).

I almost finished the complete implementation in the separate kernel module
and the current snd.ko (control) code has minimal modifications just to
redirect the necessary things to make the LED layer operational. It seems that
we can save the code in the HDA driver and we can do really light changes in
other drivers (set flags and do module load) just to get LED working without
any user space intervention.

If we come with another framework or solution in the future, we can remove
this layer (it's just one small file / module). At least, we will have marked
(the new access flags) the related controls / drivers / hardware.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
