Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92770E279
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389AE209;
	Tue, 23 May 2023 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389AE209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684860877;
	bh=XaGh/bVqVNOXxRLn5Kf9tma3kdq3q/MM8XrisWefmpQ=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bVGW60TQxp/PelP2PXMmARhotF4BMJUQDhP0sIpdd0Uj2k4T1EFYH41Fz2hMcjiaz
	 HJQlDVm7KQcEMdisdlVDkIJcQYgNRwpaWLZh/uImkwzX64f0iNlZq3+t0thBeZNC3b
	 thEq5dPENajKqWlwDTJkbwqRiBtdRFbVEZiXEQDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C7BDF80549; Tue, 23 May 2023 18:53:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 421D3F8016A;
	Tue, 23 May 2023 18:53:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D842F8024E; Tue, 23 May 2023 18:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1EB4F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:53:16 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C855E1E2A;
	Tue, 23 May 2023 18:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C855E1E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684860795; bh=nkGSSXWtQihtqt0wxzin2zSQj1X4WVOKxb4mtr6w0MY=;
	h=Date:To:References:From:Subject:In-Reply-To:From;
	b=BgQoE9ADyraUgEdWXI1RdczVepCPzsasrP2CEmj904CPkKBKXUd5mDQIBfjAr4vLf
	 QU5lkS77BLAaYtq3G8QED5gxzRza8Z7U+jJVYr4a3oaOe8THkXHgdw54sJIM1qKI19
	 E6MAnnV7umuXNPr+sv9W1y0VQkCUDK2kzO3ckaBQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 23 May 2023 18:53:13 +0200 (CEST)
Message-ID: <4a442399-9d92-0632-2354-8e31962c0728@perex.cz>
Date: Tue, 23 May 2023 18:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230523155244.12347-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH RFC] ALSA: control: Avoid nested locks at notification
In-Reply-To: <20230523155244.12347-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VLAWH75W2KSEJKXREHHTGR3KBZ7WYU3B
X-Message-ID-Hash: VLAWH75W2KSEJKXREHHTGR3KBZ7WYU3B
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLAWH75W2KSEJKXREHHTGR3KBZ7WYU3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23. 05. 23 17:52, Takashi Iwai wrote:
> The new control layer stuff introduced the nested rwsem for managing
> the list of registered control layer ops.  Since then, a global
> snd_ctl_layer_rwsem is always read at each time a control notification
> is sent via snd_ctl_notify*() in a nested matter inside the card's
> controls_rwsem lock.  This also required a bit complicated way of the
> lock at snd_ctl_activate_id() and snd_ctl_elem_write() with the
> downgrade of rwsem.
> 
> This patch is an attempt to simplify the handling of ctl layer ops.
> Now, instead of traversing the global linked list, we keep a local
> list of lops in each card instance.  This reduces the need of the
> global snd_ctl_layer_rwsem lock at snd_ctl_notify*() invocation.
> And, since the nested lock is avoided in most places, we can also
> avoid the rwsem downgrade hack in the above, too.
> 
> Since the local list entry is created dynamically,
> snd_ctl_register_layer() may return an error, and the caller needs to
> check the return value.

I'm not convinced about this transition. What about to move the layer 
notifications to a workqueue to reorder the controls_rwsem locking (kctl access) ?

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> I noticed the nested lock while looking at the pending bug report

 From the log or code ?

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

