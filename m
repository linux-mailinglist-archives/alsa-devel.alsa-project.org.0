Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F889756048
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 12:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5981BA4D;
	Mon, 17 Jul 2023 12:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5981BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689589261;
	bh=K9JYc70aBEp1yj1YDWFjGd9wjPljODZ2XMElVtS9jEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ry9fAMio/0m1z8EdouFR7HR54+tjscdkpbFVO4U2Bf9iasGXUT2kBF6UdDGcVIMQA
	 Bidf0FQ0w40DczEG2jlvmwRmlo9SIvy4uZ7yKfJO/EKClvQesJEI61zVVd1SEIIDtf
	 4xrwE/buIY9vuM7cqlj03Zt0ccVtGboU8ai6f8bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6FA7F80520; Mon, 17 Jul 2023 12:20:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 324CAF800D2;
	Mon, 17 Jul 2023 12:20:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E94F8047D; Mon, 17 Jul 2023 12:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CB4AF8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 12:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB4AF8027B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5FB2723F0B;
	Mon, 17 Jul 2023 06:19:49 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qLLKX-h8e-00; Mon, 17 Jul 2023 12:19:49 +0200
Date: Mon, 17 Jul 2023 12:19:49 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 0/8] ALSA: emu10k1: add support for high-bitrate modes
 of E-MU cards
Message-ID: <ZLUVxVUHtUJvcuZQ@ugly>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
 <87sf9vyfer.wl-tiwai@suse.de>
 <ZK0rw5j5BbyppXZ/@ugly>
 <87mt02wvsa.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87mt02wvsa.wl-tiwai@suse.de>
Message-ID-Hash: 6V3LHAMBBJ5Q44FK22TJZDNM5W2PFE54
X-Message-ID-Hash: 6V3LHAMBBJ5Q44FK22TJZDNM5W2PFE54
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6V3LHAMBBJ5Q44FK22TJZDNM5W2PFE54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 01:08:05PM +0200, Takashi Iwai wrote:
>On Tue, 11 Jul 2023 12:15:31 +0200,
>Oswald Buddenhagen wrote:
>> 
>> On Mon, Jul 10, 2023 at 05:06:36PM +0200, Takashi Iwai wrote:
>> > I still can't agree with the basic design using the dynamic kctl
>> > addition / deletion in kcontrol's put action.
>> > 
>> you are not being constructive. please provide specific, actionable
>> responses to _all_ challenges/questions.
>
>The fundamental idea to add / delete the kctls from the put callback
>is unacceptable; as repeated many times, this is known to break
>existing applications.  As long as you are sticking with this idea, it
>can go [no] further.  Please avoid it and use the (more or less) static
>configuration instead.
>
to put the implications of this in clear words:
you want me to spend additional time
on a driver barely anyone still cares about
to actively degrade the (my!) user experience
to avoid hypothetical / likely obsolete crashes
that would happen upon a rare user-controlled event
in unspecified buggy (mixer? (!)) applications,
while a known-good fallback exists (alsamixer).

i fail to see how that is even _remotely_ a reasonable request, and 
therefore have no intention whatsoever to follow it.

regards
