Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF679E11A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE11AE8;
	Wed, 13 Sep 2023 09:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE11AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694591238;
	bh=PS4DkhaFaxxWlupsSurO18wkThVHqyYQ4KNWD9XtldU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hRU24sNlROcE5w5cLXxPC/+sXFHju1UYvFV4wjBVpYcNy3SXgvCVf962mJZudGzd2
	 byqfUjWkFo2kpdbXKMARKoXJ4NsacjYwU+RZia1+MTCbimU8s8wt/2LB1e391zMgj9
	 1kYHqO9AtueBeGg9AxD2T7yt66mOMBMo5eRFT6BI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12189F8047D; Wed, 13 Sep 2023 09:46:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D017F80425;
	Wed, 13 Sep 2023 09:46:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13218F80425; Wed, 13 Sep 2023 09:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7C1DF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C1DF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1AeixEBk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pz+zduqw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8497D21862;
	Wed, 13 Sep 2023 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694591182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8Jokf9DTxkTyQ5MyT+YSqcAzs/OBurNqIDwZh4JeH8=;
	b=1AeixEBk+gMENjm21MnRJQV8Mbew2+sdy/aigNwXCuX7Dsvc79bZmTOw1KmAR5qsgAoFTk
	C8i7wtINVgB63jwo2dMVxmQqs8wFIlliY276SYIcfk+YiWSQWXK5u4s+e48Czosy3iGAiq
	W6ZcFv1pr5nCZfUe07x4b/8uQ9xtrEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694591182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8Jokf9DTxkTyQ5MyT+YSqcAzs/OBurNqIDwZh4JeH8=;
	b=pz+zduqwr1bmtN4PZyK52SmZajsSVjh8N4skviFFdM4zzXA6++y91Ghyqoxn7rE8tXLeBV
	ONFSpT75mAm/BUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4419013A34;
	Wed, 13 Sep 2023 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jfEZD85oAWXYDwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 13 Sep 2023 07:46:22 +0000
Date: Wed, 13 Sep 2023 09:46:21 +0200
Message-ID: <87wmwu4isy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: poseaydone@ya.ru
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Andy Chi <andy.chi@canonical.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Matthew Anderson <ruinairas1992@gmail.com>,
	Luka Guzenko <l.guzenko@web.de>,
	Yuchi Yang <yangyuchi66@gmail.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] patch_realtek: Splitting the UX3402 into two separate
 models.
In-Reply-To: <20230913053343.119798-1-poseaydone@ya.ru>
References: <20230913053343.119798-1-poseaydone@ya.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EJIQSJ5N3VCBMCVCXEP277XIS6UYBGKA
X-Message-ID-Hash: EJIQSJ5N3VCBMCVCXEP277XIS6UYBGKA
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJIQSJ5N3VCBMCVCXEP277XIS6UYBGKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 07:33:43 +0200,
poseaydone@ya.ru wrote:
> 
> From: Knyazev Arseniy <poseaydone@ya.ru>
> 
> UX3402VA and UX3402ZA models require different hex values, so comibining
> them into one model is incorrect.
> 
> Signed-off-by: Knyazev Arseniy <poseaydone@ya.ru>

Thanks, applied now.


Takashi
