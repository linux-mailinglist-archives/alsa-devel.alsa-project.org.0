Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F27A7332
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 08:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E3079F6;
	Wed, 20 Sep 2023 08:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E3079F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695192806;
	bh=gjdQrL8tjnlfoAbMhZIb/XH40oWh5nQkQUjscanNUIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=He3HO3LlLVfhjTGNE+N4G2ZqqoOWoqs4UbPeoMBPsD+0p2626f1TykfLiRkBj7Qma
	 RlSV3NGpSzcLDMxKuTzSx3DKAhW87Nmcodzie6QQ8gqo5c4RPQ+HOv+wiwNSru85zp
	 aM6YIQhJIWMiP1yl/TWx0sf823uH3ep2iL61PrwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C114F800F4; Wed, 20 Sep 2023 08:52:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C79F801F5;
	Wed, 20 Sep 2023 08:52:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E321F8025A; Wed, 20 Sep 2023 08:52:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07857F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 08:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07857F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mxDDWZC5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1pSxjxGH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 443211F385;
	Wed, 20 Sep 2023 06:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695192718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j9BV2FsReo3bjFArOmq56b9nQaunFJcbl9Kf+vMrcew=;
	b=mxDDWZC5pQ85391QKVOI6L/APZo86pstKE8SYQtSqPsEY0oH78XR62ugA+TRGvjZE1m4Di
	K/v1N4ACSf0I3nIdyJl8ItrqbjTC/abIk3iIjoTWRhCGl1KOlPLz6G7G6nwJQRhbX0oI0W
	wvVuRf/2GHrrX/Es17yZOZ53LFLrmYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695192718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j9BV2FsReo3bjFArOmq56b9nQaunFJcbl9Kf+vMrcew=;
	b=1pSxjxGHqSr4xqiz8ATQRyZo+WqHFi9jEUhz1YCyVeOQyAaT8/99LU9TySlqb53ysOW9vF
	Dv8w3toVZG1FRACw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06FB51333E;
	Wed, 20 Sep 2023 06:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 352+AI6WCmX4HwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 06:51:58 +0000
Date: Wed, 20 Sep 2023 08:51:57 +0200
Message-ID: <874jjpwd4i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda: cirrus_scodec: Add KUnit test
In-Reply-To: <ZQoILN6QCjzosCOs@google.com>
References: <20230918095129.440-1-rf@opensource.cirrus.com>
	<20230918095129.440-3-rf@opensource.cirrus.com>
	<ZQoILN6QCjzosCOs@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SHYSO5HE5BBEJDSI7HPRR2LGP6TSUCBN
X-Message-ID-Hash: SHYSO5HE5BBEJDSI7HPRR2LGP6TSUCBN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHYSO5HE5BBEJDSI7HPRR2LGP6TSUCBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 22:44:28 +0200,
Nick Desaulniers wrote:
> 
> On Mon, Sep 18, 2023 at 10:51:29AM +0100, Richard Fitzgerald wrote:
(snip)
> > +static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
> > +						int gpio_num)
> > +{
> > +	struct software_node_ref_args template =
> > +		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> 
> I'm observing the following error when building with:
> 
> $ make LLVM=1 -j128 allmodconfig sound/pci/hda/cirrus_scodec_test.o
> 
> sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not a compile-time constant
>   151 |                 SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
>       |                                                                          ^~~~~~~~
> /builds/linux/include/linux/property.h:291:37: note: expanded from macro 'SOFTWARE_NODE_REFERENCE'
>   291 |         .nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
>       |                                            ^~~~~~~~~~~
> /builds/linux/include/linux/kernel.h:57:75: note: expanded from macro 'ARRAY_SIZE'
>    57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>       |                                                                           ^~~
> /builds/linux/include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
>   228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>       |                                                                ^
> /builds/linux/include/linux/compiler_types.h:366:63: note: expanded from macro '__same_type'
>   366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>       |                                                               ^
> /builds/linux/include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>       |                                                              ^

Hm, this looks like some inconsistent handling of the temporary array
passed to ARRAY_SIZE() in the SOFTWARE_NODE_REFERENCE macro.  LLVM
can't treat it if it contains a variable in the given array, while GCC
doesn't care.

A hackish workaround would be the patch like below, but it's really
ugly.  Ideally speaking, it should be fixed in linux/properties.h, but
I have no idea how to fix there for LLVM.

Adding more relevant people to Cc.


thanks,

Takashi

--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -148,8 +148,9 @@ static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *a
 						int gpio_num)
 {
 	struct software_node_ref_args template =
-		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
+		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, 0, 0);
 
+	template.args[0] = gpio_num;
 	*arg = template;
 }
 
