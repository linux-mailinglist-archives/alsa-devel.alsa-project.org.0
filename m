Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E834799E09
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Sep 2023 14:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0147F4;
	Sun, 10 Sep 2023 14:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0147F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694348300;
	bh=rxcLPPacSgeUA84CnGA96VbiY6TrfHW+JSQIxr6BT6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S5FUEFiCno8/7/LF4gUZs1PBk03GJsNEzik3J7c33cdC+y5m4pt+RjbHCWsPN4Cz+
	 cwBtbGEItbB0jkGWsHOBPpQ/ftQTHXzg3fwDblSJbyyaiN9uVfondPNuAOqCd8IcUn
	 05OPY+654aC78JUQmif4cGdOhaFslZEO/UPlGFYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10FD8F8055A; Sun, 10 Sep 2023 14:17:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C367F80425;
	Sun, 10 Sep 2023 14:17:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 448DCF80425; Sun, 10 Sep 2023 14:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92747F800AA
	for <alsa-devel@alsa-project.org>; Sun, 10 Sep 2023 14:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92747F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=W6zU1px5
Received: from [192.168.1.22] (62-116-56-22.adsl.highway.telekom.at
 [62.116.56.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 52F4D640E9;
	Sun, 10 Sep 2023 14:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1694348075;
	bh=zxoYRo8UGu8IH5Fv+IN8hg3S1Hx2wwIke9MLnmP6Asw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6zU1px5svuCduRbB0lxiKQ4YGSpoDoLBoYe7VChE1oMWczLGt7QgadlmcNfp2J8G
	 GphsiUcXNTgMKccCBPXzvJhj67If6l2XpwgqKoWpDoYsE5022A6Gye7SaYp1RKMoYV
	 ByWTUkZLwf3GTck/3fzNW11hL+Ed4KJe5db+KR2A=
Received: by camel3.lan (Postfix, from userid 1000)
	id 9F018540202; Sun, 10 Sep 2023 14:14:34 +0200 (CEST)
Date: Sun, 10 Sep 2023 14:14:34 +0200
From: Matthias Reichl <hias@horus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix broken channel map reporting
Message-ID: <ZP2zKg88n4MaD53z@camel3.lan>
References: <20230909114633.3193-1-hias@horus.com>
 <ZPxo8qKMDkmBqGxw@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPxo8qKMDkmBqGxw@finisterre.sirena.org.uk>
Message-ID-Hash: DYZ42IQHYRNJ424G2JYTNSU4HSG5Y6M7
X-Message-ID-Hash: DYZ42IQHYRNJ424G2JYTNSU4HSG5Y6M7
X-MailFrom: hias@horus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYZ42IQHYRNJ424G2JYTNSU4HSG5Y6M7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Sep 09, 2023 at 01:45:38PM +0100, Mark Brown wrote:
> On Sat, Sep 09, 2023 at 01:46:33PM +0200, Matthias Reichl wrote:
> > Commit 4e0871333661 ("ASoC: hdmi-codec: fix channel info for
> > compressed formats") accidentally changed hcp->chmap_idx from
> > ca_id, the CEA channel allocation ID, to idx, the index to
> > the table of channel mappings ordered by preference.
> > 
> > This resulted in wrong channel maps being reported to userspace,
> > eg for 5.1 "FL,FR,LFE,FC" was reported instead of the expected
> > "FL,FR,LFE,FC,RL,RR":
> 
> Presumably this will cause a regression for people using compressed
> formats - isn't the fix here to make this behaviour conditional on if
> the format is compressed?

This change won't affect passthrough, the values of the HDMI audio
infoframe are stored separately, in hdmi_codec_params.cea.

chmap_idx in hdmi_codec_priv is only used by the get PCM channel map
control - which userspace shouldn't use in the non-PCM case.

Before the "fix channel info for compressed formats" change the control
would always return a matching channel map, i.e. "FL FR" in the 2-channel
case, regardless if PCM or non-PCM was used.

When using high bitrate compressed streams, which are passed through as
8ch (containing 4 consecutive frames), this leads to a problem though as
the sink might not announce support for 8 speakers (eg on TVs with 2 speakers
and "virtual surround") and thus finding a channel map would fail.

The "fix channel info" patch addressed this issue by only searching for a
channel map in the PCM case.

In the non-PCM case ca_id is set to 0 which means "FL, FR" - CTA doesn't
have a separate value for "n/a" but specifies that the channel allocation
only applies to PCM streams with more than 2 channels. Although the spec
says the value doesn't apply to non-PCM some TVs seem to look at it and
refuse to output HBR (TrueHD etc) if it's set to something other than 0.

My plan was to return the exact same info via the channel map control
as we set in the info frame but unfortunately I messed up and accidentally
used the wrong value which this patch tries to rectify.

I'm not really sure though if that's the best (or even proper) way for
the channel map control to behave in the non-PCM case - it'll either return
"FL, FR" or "FL, FR, UNKNOWN, UNKNOWN, UNKNOWN, UNKNOWN, UNKNOWN, UNKNOWN"
with this patch.

An alternative would be to set chmap_idx to HDMI_CODEC_CHMAP_IDX_UNKNOWN
in the non-PCM case so the channel map control will return UNKNOWN for
all channels. i.e. use this code instead:

        if (pcm_audio)
                hcp->chmap_idx = ca_id;
        else
                hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;

Any input on that topic is highly appreciated.

so long & thanks,

Hias
