Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF8886B70
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 12:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8382F231C;
	Fri, 22 Mar 2024 12:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8382F231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711107816;
	bh=KEf7AJgP49CriNF33PDaKitjypsXg5PyRJJ7ZNypu2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AompXa8tUdip4soEHWv2ZMFLVaAXD1N9KIm+5iblMx0W3TAJV14p5CrTpret6HO47
	 UFP92dt1l26I+JcsCXVVq3nF+dRD+u+mi+vh7gUP8fXwkt9dD8Q4/DXvmnBDAHaLtj
	 Tne4pkkREmM/oVVMm09Py9WPBzAwQhKeLL0Iyja8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B64F80588; Fri, 22 Mar 2024 12:43:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F55F8059F;
	Fri, 22 Mar 2024 12:43:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65B8F804E7; Fri, 22 Mar 2024 12:42:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FB9BF80093
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 12:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB9BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pymcvaSo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xXFwnkof;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pymcvaSo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xXFwnkof
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EC67384CD;
	Fri, 22 Mar 2024 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711107771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=pymcvaSosW92Fh5ANvXJSFBH8LHsPp6a32ov7lMzYK5cWmGHP+CNt21c/5go/1Z7JwY8f4
	TO86HHT3t1eQtTnKMGqwmb4kTV8NqOBW9AL/rPpCCZq5/xsaLnzohhDh/DVuMo+k0bRc3s
	Ke9zWDJgRzCZW51gAJErKnuEKrzZteo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711107771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=xXFwnkofBxqVyEt6jrKMiKBVmTSt00Dyf74QSM5Qv4RYdK4LMxE6ltDkfGtGd7BqMxz7n2
	SkE6PvDT8wf+lxCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711107771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=pymcvaSosW92Fh5ANvXJSFBH8LHsPp6a32ov7lMzYK5cWmGHP+CNt21c/5go/1Z7JwY8f4
	TO86HHT3t1eQtTnKMGqwmb4kTV8NqOBW9AL/rPpCCZq5/xsaLnzohhDh/DVuMo+k0bRc3s
	Ke9zWDJgRzCZW51gAJErKnuEKrzZteo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711107771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=xXFwnkofBxqVyEt6jrKMiKBVmTSt00Dyf74QSM5Qv4RYdK4LMxE6ltDkfGtGd7BqMxz7n2
	SkE6PvDT8wf+lxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 488D2136AD;
	Fri, 22 Mar 2024 11:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 65DKDrtu/WXscAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Mar 2024 11:42:51 +0000
Date: Fri, 22 Mar 2024 12:42:51 +0100
Message-ID: <87plvmwkzo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: Re: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
In-Reply-To: <ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
	<ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.38)[90.73%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com,intel.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pymcvaSo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xXFwnkof
X-Rspamd-Queue-Id: 9EC67384CD
Message-ID-Hash: K4FAGYQ57PTEKDHMSTNZC5MO36NEZD3B
X-Message-ID-Hash: K4FAGYQ57PTEKDHMSTNZC5MO36NEZD3B
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4FAGYQ57PTEKDHMSTNZC5MO36NEZD3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Mar 2024 12:30:44 +0100,
Péter Ujfalusi wrote:
> 
> Hi Takashi,
> 
> On 27/11/2023 14:06, Peter Ujfalusi wrote:
> > Hi,
> > 
> > SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
> > up the blob from the NHLT table. This causes issues since alsa-utils commit
> > 3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")
> > 
> > The dev_type is no longer always 0 in the topology embedded NHLT table resulting
> > lookup failures for analog codecs since they will have dev_type=4.
> > 
> > With SOF the dev_type is not used, we always use the SSP port index for looking
> > up the configuration blob.
> > 
> > The solution for the issue is to fetch the dev_type for the SSP port and feed it
> > back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
> > regardless of the assigned dev_type.
> 
> Can you take these patches via the ALSA tree, I have hoped that it would
> land in 6.9.

It seems like to be overlooked.  I applied those now to for-linus
branch.  But it missed the PR to 6.9-rc1, so at earliest for 6.9-rc2.


thanks,

Takashi
