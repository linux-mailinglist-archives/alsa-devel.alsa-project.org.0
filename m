Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477947A7632
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 10:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EAFFA4B;
	Wed, 20 Sep 2023 10:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EAFFA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695199402;
	bh=zPUICiC9IfbnKTdlyFeZmL9jdk6iWITEvTjj+6CRcqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYoM2T3CFMiR1xt/HlfnyqYgW7J233bbWLz1dPvmXrFPeJb2oJLFVPBZv4J+Aasbm
	 QWtG2Ght+LLqrFE3VoeuJ9CugOUQyrMnAlnyuHRKWRT7mFhzDyUEbOczpWfqY4/FrY
	 SkISt0acMdgI0ttQGjQO9jdhiiGj6BL7ziX6sQ4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8818AF8047D; Wed, 20 Sep 2023 10:42:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E4BF801F5;
	Wed, 20 Sep 2023 10:42:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1ACF8025A; Wed, 20 Sep 2023 10:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 112DBF800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 10:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112DBF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DnPrnIJe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kTHnCRY2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B5B7022476;
	Wed, 20 Sep 2023 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695199339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgZwt1T4d3hqvoQNUQ17EeQ3XSK0TCSwEQOyJOeNjhM=;
	b=DnPrnIJeqRiZu04zLpzzJdvXZs85anv9N55kSKe4KevOMka/Z3Db/X4CWlXgVgCaXM0Gax
	mk8lNcu6iIsvjYuEwOH99zYKL2pe0+jEjZKk7JQ6gVcud7gQvta2K/sd8lJ+270a79lK8j
	53cnpNpNSKuVlwFKF1O/Q514y7qQoZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695199339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgZwt1T4d3hqvoQNUQ17EeQ3XSK0TCSwEQOyJOeNjhM=;
	b=kTHnCRY2vVNXTDOfIKdsXnboCL/f4BXoyBcZA5SeIq0/xa5N7jBxpxv5jnHIhhVKW8S98M
	ZH3yksLM2yM8kOAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76F26132C7;
	Wed, 20 Sep 2023 08:42:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4xEJHGuwCmWSXAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 08:42:19 +0000
Date: Wed, 20 Sep 2023 10:42:18 +0200
Message-ID: <87o7hxutg5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	<tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus
	<heikki.krogerus@linux.intel.com>,
	Sakari Ailus
	<sakari.ailus@linux.intel.com>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH 2/2] ALSA: hda: cirrus_scodec: Add KUnit test
In-Reply-To: <9e2291c1-9a6c-ba6b-ea0f-ad130d2596f4@opensource.cirrus.com>
References: <20230918095129.440-1-rf@opensource.cirrus.com>
	<20230918095129.440-3-rf@opensource.cirrus.com>
	<ZQoILN6QCjzosCOs@google.com>
	<874jjpwd4i.wl-tiwai@suse.de>
	<9e2291c1-9a6c-ba6b-ea0f-ad130d2596f4@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FO26AMS43RP44YCSKSHLWHW6U63SFFCT
X-Message-ID-Hash: FO26AMS43RP44YCSKSHLWHW6U63SFFCT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO26AMS43RP44YCSKSHLWHW6U63SFFCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 10:27:58 +0200,
Richard Fitzgerald wrote:
> 
> On 20/9/23 07:51, Takashi Iwai wrote:
> > On Tue, 19 Sep 2023 22:44:28 +0200,
> > Nick Desaulniers wrote:
> >> 
> >> On Mon, Sep 18, 2023 at 10:51:29AM +0100, Richard Fitzgerald wrote:
> > (snip)
> >>> +static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
> >>> +						int gpio_num)
> >>> +{
> >>> +	struct software_node_ref_args template =
> >>> +		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> >> 
> >> I'm observing the following error when building with:
> >> 
> >> $ make LLVM=1 -j128 allmodconfig sound/pci/hda/cirrus_scodec_test.o
> >> 
> >> sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not a compile-time constant
> >>    151 |                 SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> >>        |                                                                          ^~~~~~~~
> >> /builds/linux/include/linux/property.h:291:37: note: expanded from macro 'SOFTWARE_NODE_REFERENCE'
> >>    291 |         .nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> >>        |                                            ^~~~~~~~~~~
> >> /builds/linux/include/linux/kernel.h:57:75: note: expanded from macro 'ARRAY_SIZE'
> >>     57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
> >>        |                                                                           ^~~
> >> /builds/linux/include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
> >>    228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
> >>        |                                                                ^
> >> /builds/linux/include/linux/compiler_types.h:366:63: note: expanded from macro '__same_type'
> >>    366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
> >>        |                                                               ^
> >> /builds/linux/include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
> >>        |                                                              ^
> > 
> > Hm, this looks like some inconsistent handling of the temporary array
> > passed to ARRAY_SIZE() in the SOFTWARE_NODE_REFERENCE macro.  LLVM
> > can't treat it if it contains a variable in the given array, while GCC
> > doesn't care.
> > 
> > A hackish workaround would be the patch like below, but it's really
> > ugly.  Ideally speaking, it should be fixed in linux/properties.h, but
> > I have no idea how to fix there for LLVM.
> > 
> > Adding more relevant people to Cc.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > --- a/sound/pci/hda/cirrus_scodec_test.c
> > +++ b/sound/pci/hda/cirrus_scodec_test.c
> > @@ -148,8 +148,9 @@ static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *a
> >   						int gpio_num)
> >   {
> >   	struct software_node_ref_args template =
> > -		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> > +		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, 0, 0);
> >   +	template.args[0] = gpio_num;
> >   	*arg = template;
> >   }
> >   
> 
> The tests must generate sw nodes dynamically, not a fixed const struct.
> I wanted to avoid directly accessing the internals of the SW node
> structures. Use only the macros.
> 
> I can rewrite this code to open-code the construction of the
> software_node_ref_args. Or I can wait a while in case anyone has a
> suggested fix for the macros.
> 
> Its seems reasonable that you should be able to create software nodes
> dynamically. A "real" use of these might need to construct the data from
> some other data that is not known at runtime (for example, where the
> ACPI provides some information but not the necessary info).

Yeah, fixing the macro would be ideal.

An easy and compromise solution would be to factor out the
ARRAY_SIZE() call and allow giving nargs explicitly.

e.g.

--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -285,13 +285,18 @@ struct software_node_ref_args {
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
 
-#define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
+#define __SOFTWARE_NODE_REFERENCE(_ref_, _nargs_, ...)		\
 (const struct software_node_ref_args) {				\
 	.node = _ref_,						\
-	.nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\
+	.nargs = _nargs_,					\
 	.args = { __VA_ARGS__ },				\
 }
 
+#define SOFTWARE_NODE_REFERENCE(_ref_, ...) \
+	__SOFTWARE_NODE_REFERENCE(_ref_,\
+		ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,\
+		##__VA_ARGS__)
+
 /**
  * struct property_entry - "Built-in" device property representation.
  * @name: Name of the property.
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -148,7 +148,7 @@ static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *a
 						int gpio_num)
 {
 	struct software_node_ref_args template =
-		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
+		__SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, 2, gpio_num, 0);
 
 	*arg = template;
 }


... though I'm not convinced by this change, either.


Takashi
