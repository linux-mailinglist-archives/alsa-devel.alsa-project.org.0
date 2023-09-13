Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EE79E110
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590B8DEB;
	Wed, 13 Sep 2023 09:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590B8DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694591084;
	bh=E0f3YBgJY55J7qWXbuWI2AmrHxED/FSN6Gj+67Np87o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l7/OsIYkODWbqmLZ7gBUUBJpncDcmuaMve3dLqPjQPZJhMRJ2/mR56DNyM/dAg80W
	 TKyGnxEi5zFhy8OOuKzCdU+98ltZ+ZrqrhiqqQWHXuCPEWP5VyLRmfsU1uSjy3SKGF
	 0VlYJgO+de4ZugJhj3EqUznSI84IGE+oFDrZ07n8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F700F80551; Wed, 13 Sep 2023 09:43:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8E4F80551;
	Wed, 13 Sep 2023 09:43:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95DD6F80552; Wed, 13 Sep 2023 09:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 281E1F80537
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281E1F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZAi7Bt/4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fQquTscP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 319D01F45B;
	Wed, 13 Sep 2023 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694591015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqGSMVkAA4Ewp/wOJFgzYA6OwmPk0CC2NscF4DotmQA=;
	b=ZAi7Bt/464oMhiiIs39kEjyATKaMlSMniG38aSFc9vmPpFCEPg3BbJBAXzFApg4em+prlk
	ukmbUJ7ahsCkbYs/fO8zHJ3+l9bb3G1S17FFVd/zqZwkov94Ijbdos8BrA7UouSqOuCccc
	Saod/u0m5THe+YzVFzv2f4H76d1I5bA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694591015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqGSMVkAA4Ewp/wOJFgzYA6OwmPk0CC2NscF4DotmQA=;
	b=fQquTscPU1Y2kAIPsR1Xt6FzlLFQAVMs4Z6gbNDTTTiR1tM5XjwuKiXeD+n0+f1+gLaKS/
	ByxttswjXYqI+dCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0140013582;
	Wed, 13 Sep 2023 07:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +vz0OiZoAWURDgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 13 Sep 2023 07:43:34 +0000
Date: Wed, 13 Sep 2023 09:43:34 +0200
Message-ID: <87y1ha4ixl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: Use u8 type for link index
In-Reply-To: <20230912162617.29178-1-peter.ujfalusi@linux.intel.com>
References: <20230912162617.29178-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X7USSQAJGIRU6J644EVSQNFF57FLHALR
X-Message-ID-Hash: X7USSQAJGIRU6J644EVSQNFF57FLHALR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7USSQAJGIRU6J644EVSQNFF57FLHALR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 18:26:17 +0200,
Peter Ujfalusi wrote:
> 
> Use consistently u8 for sdw link index. The id is limited to 4, u8 is
> adequate in size to store it.
> 
> This change will also fixes the following compiler warning/error (W=1):
> 
> sound/hda/intel-sdw-acpi.c: In function ¡sdw_intel_acpi_scan¢:
> sound/hda/intel-sdw-acpi.c:34:35: error: ¡-subproperties¢ directive output may be truncated writing 14 bytes into a region of size between 7 and 17 [-Werror=format-truncation=]
>    34 |                  "mipi-sdw-link-%d-subproperties", i);
>       |                                   ^~~~~~~~~~~~~~
> In function ¡is_link_enabled¢,
>     inlined from ¡sdw_intel_scan_controller¢ at sound/hda/intel-sdw-acpi.c:106:8,
>     inlined from ¡sdw_intel_acpi_scan¢ at sound/hda/intel-sdw-acpi.c:180:9:
> sound/hda/intel-sdw-acpi.c:33:9: note: ¡snprintf¢ output between 30 and 40 bytes into a destination of size 32
>    33 |         snprintf(name, sizeof(name),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    34 |                  "mipi-sdw-link-%d-subproperties", i);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> The warnings got brought to light by a recent patch upstream:
> commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks, applied now.


Takashi
