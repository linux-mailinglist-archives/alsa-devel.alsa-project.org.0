Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE074B1B2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 15:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14EDA3E7;
	Fri,  7 Jul 2023 15:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14EDA3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688736071;
	bh=NcjsXxFwOFQauUwa6hDLJ++IU/BjKGU1xE5rv2Y8C1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2Uty+FN3hxTljxP7roXcqkqw8j2FdHTuSUQTM+j4yczzRQWmdeKDTPgdWpAACskj
	 xkawKzWZrTqW6PJe8geNLZjdv6Gctt1K25r9fNxWQRDvepQM4ZvLlLoa97mc9bK7zB
	 aEBJncgQkGXU8M8vmAH3O0qZsOSlrhKyQTHXdGuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7727BF8053B; Fri,  7 Jul 2023 15:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C80F80124;
	Fri,  7 Jul 2023 15:20:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24921F80125; Fri,  7 Jul 2023 15:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35284F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35284F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TZlYlRRU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+a+gdlqQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75F25225EC;
	Fri,  7 Jul 2023 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688736011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNyk8rEvT/WeKKmpb7nlokLV1tikUvvvzyU4QMCSflU=;
	b=TZlYlRRU41HI1fYx2xJpMb5oVokM0T+eDNotH7caV1igxRTdfcMEUYtJQKv4PignIssLyB
	I6QecqaWmvS0G4RHOfbf7gEAa9hBY0Y+Vv1TxYiugjQyXKPho2HcUxxM8Ii8rum6/Cn47B
	UKt+4XSNMLR+bpXQtwAlqAeShqkyXtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688736011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNyk8rEvT/WeKKmpb7nlokLV1tikUvvvzyU4QMCSflU=;
	b=+a+gdlqQXQKCIJXRHWKJXxe5EnLeB26FiwAmJrLuY1dWao2/shy5wl1phTzwGq59gaVrIJ
	CnqgXUb3xM0EEsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33A761346D;
	Fri,  7 Jul 2023 13:20:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6SNVCwsRqGQ9VAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 07 Jul 2023 13:20:11 +0000
Date: Fri, 07 Jul 2023 15:20:10 +0200
Message-ID: <87y1jrkgdx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
In-Reply-To: <efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
	<ZKfAUOOcGoBanHHu@hovoldconsulting.com>
	<efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EPTLMV552726QHXGLFNQABX7ZP52OJ6W
X-Message-ID-Hash: EPTLMV552726QHXGLFNQABX7ZP52OJ6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPTLMV552726QHXGLFNQABX7ZP52OJ6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 14:54:31 +0200,
Srinivas Kandagatla wrote:
> 
> On 07/07/2023 08:35, Johan Hovold wrote:
> > On Wed, Jul 05, 2023 at 01:57:23PM +0100, Srinivas Kandagatla wrote:
> >> dB range for HPHL and HPHR gains are from +6dB to -30dB in steps of
> >> 1.5dB with register values range from 0 to 24.
> >> 
> >> Current code maps these dB ranges incorrectly, fix them to allow proper
> >> volume setting.
> >> 
> >> Fixes: e8ba1e05bdc0("ASoC: codecs: wcd938x: add basic controls")
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/wcd938x.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> >> index faa15a5ed2c8..3a3360711f8f 100644
> >> --- a/sound/soc/codecs/wcd938x.c
> >> +++ b/sound/soc/codecs/wcd938x.c
> >> @@ -210,7 +210,7 @@ struct wcd938x_priv {
> >>   };
> >>     static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600,
> >> -1800);
> >> -static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(line_gain, 600, -3000);
> >> +static const DECLARE_TLV_DB_SCALE(line_gain, -3000, 150, -3000);
> > 
> > This looks wrong, and indeed that forth argument appears to be a mute
> > flag. I guess that one should have been 0 (false) here?
> 
> yes, this should be true instead of a mute dB value.
> 
> > 
> > Headphone output also appears to be way too loud by default with this
> > patch (alone) applied. Perhaps it's just the default mixer settings need
> > to be updated to match?
> > 
> > It looks like you're inverting the scale above. Perhaps that's intended,
> 
> yes, the highest value corresponds to lowest dB which is why its inverted.

Ouch, that's a bad design choice...


Takashi
