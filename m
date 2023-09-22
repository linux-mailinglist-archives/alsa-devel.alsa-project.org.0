Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D57AAD1B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 10:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 685D5DEE;
	Fri, 22 Sep 2023 10:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 685D5DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695372641;
	bh=ZF6fT8J8vMD/0U7xQvXa4ueUS/D29bhK/dH5xIljlqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UiYG4c9KmaHyPgrcmdiJ1GxetmqMqbnJtm3h5twYZ7Dlu6cirid1qcVhuD1rKz8Sk
	 SDwrxhh86IkKP5aqXg8QT8KPNAvz/k4FBZ6BI5+zs3HHzek9rYblMvDzP2WK7KUWpg
	 2O5HM6hoKKwTVW7F8pepZbZQOuJYZ6bMypk8o8ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2571EF8025A; Fri, 22 Sep 2023 10:49:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E21CF80125;
	Fri, 22 Sep 2023 10:49:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18AB1F801F5; Fri, 22 Sep 2023 10:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9952EF800F4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 10:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9952EF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GRglEksv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+hUkuCyX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 933171F38A;
	Fri, 22 Sep 2023 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695372581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yJwNh6tt3I2URhiAbImeySdxShqBvX1XJXiHR26G5wU=;
	b=GRglEksvTLtGJZDqKZpBqiE7p9xYddPbL7fgKxfzPTzzuSLI/9/ut8YLO/kVRtbqn607k9
	qHqdzPjmzZoEUqtzo5arpjeI1ynM0rNNKwZp8gxBY+H8xTTlXUng2qWZsxVn0bNn/376jx
	LDe3nuHOX36/RS3w3NoQkegB+fArWkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695372581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yJwNh6tt3I2URhiAbImeySdxShqBvX1XJXiHR26G5wU=;
	b=+hUkuCyXOjuMPg5bXlfcylF0ciSmaZgF6stQ/U26LnV8m5Jyj8HUIG6ZwlHEoA1PSAhIdj
	av9Nq5OSqCaRYJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65AAF13597;
	Fri, 22 Sep 2023 08:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9mLtFyVVDWXmRwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 08:49:41 +0000
Date: Fri, 22 Sep 2023 10:49:40 +0200
Message-ID: <87fs36egnv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 0/4] Support mute notifications for CS35L41 HDA
In-Reply-To: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
References: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LJYQPSXLJ7U5535ZNXHKAYUCI3BMOW6E
X-Message-ID-Hash: LJYQPSXLJ7U5535ZNXHKAYUCI3BMOW6E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJYQPSXLJ7U5535ZNXHKAYUCI3BMOW6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 18:28:45 +0200,
Stefan Binding wrote:
> 
> Some systems use a special keyboard shortcut to mute speaker audio.
> On systems using CS35L41 HDA which have this shortcut, add a
> mechanism which uses ACPI notifications to determine when the
> shortcut is pressed, and then mute the amps inside the driver.
> 
> Since this is not a normal mute mechanism, it does not go through
> userspace. To allow userspace to be able to track this special
> state, add an ALSA control which tracks the state of this forced
> mute
> 
> Changes since v2:
> - Fixed compile issue when CONFIG_ACPI is missing
> 
> Changes since v3:
> - Split first patch into 3 separate patches
> - Ensure all acpi code is protected by check for CONFIG_ACPI in
> realtek driver
> 
> Changes since v4:
> - Rebase onto for-next branch
> 
> Stefan Binding (4):
>   ALSA: hda: cs35l41: Add notification support into component binding
>   ALSA: hda/realtek: Support ACPI Notification framework via component
>     binding
>   ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
>   ALSA: hda: cs35l41: Add read-only ALSA control for forced mute

Applied to for-next branch now.  Thanks.


Takashi
