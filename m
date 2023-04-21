Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C426EA7D2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 12:06:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448527F4;
	Fri, 21 Apr 2023 12:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448527F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682071560;
	bh=7ICPeO+K/+dKziTbDxydFK9BO+TFb1XAPRYcpZ1yAmY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RnLZNj0eNpy5xX3AJ21uguIZ4NgAxXmhujaMp3xJUZAJHnkIMXFYbn9r/KzHz8Ftw
	 8LwxxMEOE5urrU2a0Yjeyg6eBLdp+wLXTy0yKFj0kmcwRcVVdyW3t9j9fTYVKcJ+p1
	 oPiAH4MbL5EjSoq66B1294h/MKqLgX3Hm/KTdBGc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 317F5F80149;
	Fri, 21 Apr 2023 12:05:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFFA4F80155; Fri, 21 Apr 2023 12:05:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86D99F800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 12:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D99F800F8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 53FF324194;
	Fri, 21 Apr 2023 06:05:00 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppndT-82N-00; Fri, 21 Apr 2023 12:04:59 +0200
Date: Fri, 21 Apr 2023 12:04:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZEJfyzFXVuLHPs+S@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
 <20230420113324.877164-2-oswald.buddenhagen@gmx.de>
 <6b7275c2-4f88-46ed-3b8b-076298c7562a@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6b7275c2-4f88-46ed-3b8b-076298c7562a@perex.cz>
Message-ID-Hash: L67UGQEGDJSUKU3AVT6ONNUJDIUGDP2B
X-Message-ID-Hash: L67UGQEGDJSUKU3AVT6ONNUJDIUGDP2B
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L67UGQEGDJSUKU3AVT6ONNUJDIUGDP2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 21, 2023 at 11:33:35AM +0200, Jaroslav Kysela wrote:
>On 20. 04. 23 13:33, Oswald Buddenhagen wrote:
>> Draining will always playback somewhat beyond the end of the filled
>> buffer. This would produce artifacts if the user did not set up the
>> auto-silencing machinery, which is an extremely easy mistake to make, as
>> the API strongly suggests convenient fire-and-forget semantics. This
>> patch makes it work out of the box.
>
>NACK. The initial implementation should be put to alsa-lib as discussed.
>
as discussed, a user-space only implementation based on the current 
kernel api is not reasonable:
it could either enable auto-silencing on device open (which would be 
unreasonably expensive) or it could enable it on drain (and disable it 
once draining is done, which would be unreasonably complex due to 
needing to handle asynchronous draining completion).

so we would at least need a kernel api to enable silence-on-drain, which 
user space could apply on device open.
this would be easy enough to do, but i really don't see a point in 
adding that complexity, given that it should be always enabled, lest it 
won't have much of a real-world impact.

fwiw, i just realized that the argument against touching the mmap'd 
buffer is even weaker with the updated implementation, as it only clears 
as much as user space would have to clear anyway (pedantically, i could 
round it down to the end of a period rather than filling two whole 
periods, if that's the bit that convinces you).

regards
