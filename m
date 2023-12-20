Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDB81A1CD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 16:06:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 870BD83A;
	Wed, 20 Dec 2023 16:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 870BD83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703084783;
	bh=Fn78F//SgOCPwTkyAwA2Ps1c7j0bHGkF3dZIGscnqd8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWNZAk9hvBppqNNlbk+sSwtkpeezHqVi5wygBLiAFwho6b+8BR5qaEriFNxRtl1Mh
	 pUx9wgFTw1QvVxz7hbImZzCfUYmAVnnAlNwgXxIKGV+o2B1qoZSAWZ54Ia9Tiw+xKO
	 jYmVedFGP3g7zSSBAMoeGlRgxL9zgW1IBHdf9eNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B859F80563; Wed, 20 Dec 2023 16:05:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 047A5F8056F;
	Wed, 20 Dec 2023 16:05:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B093F80425; Wed, 20 Dec 2023 16:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDE4F800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 16:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDE4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dee+QAkN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKC0EC3006041;
	Wed, 20 Dec 2023 09:05:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=VoS23jY/2oEqOUF
	sm3GzzqEiLhJ034GXskQI+tgrc7U=; b=dee+QAkNAinYv7/7btgw9BYo9vmwgjg
	Ugi8oWb+WzxtsHdYI/RmNDdnqNFyswVxKvqfGGVjkQyyFDPZ4kS4NwgEpJJPc+TS
	6OgvFkduHH1BtR663ieyDE/agr9DSGS1KSmiWM13ZCbOgf2Fe5rEF6+KniyWKcYx
	VISklsB6go6QWz0wBgg0Pl0ZXp4Bx/iDtjzMQmc3M8kxHq9USRsy7xWopQKqkbTE
	v21+2qhe5DX0npPzUvYBcGxUtEAsBKj75G6RXCALrvYoU5/Hy1uMXqqz92bbSkgX
	6pVK8uL06169pIS1tCkkNUes+vyZM9rN0JOWMGH1Zu6a72MnKvwGmKA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196ndjhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 09:05:36 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 15:05:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 20 Dec 2023 15:05:34 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7612011CC;
	Wed, 20 Dec 2023 15:05:34 +0000 (UTC)
Date: Wed, 20 Dec 2023 15:05:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add basic support
 for cs42l43
Message-ID: <20231220150534.GC14858@ediswmail.ad.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
 <20231207095524.GM14858@ediswmail.ad.cirrus.com>
 <d3ed56d5-2b1a-4626-8b18-0f9c8bb48c73@perex.cz>
 <20231208120026.GO14858@ediswmail.ad.cirrus.com>
 <20231219164539.GB14858@ediswmail.ad.cirrus.com>
 <4ba79276-3b37-46ea-ad6f-805f51788c0c@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4ba79276-3b37-46ea-ad6f-805f51788c0c@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ibc3TvWmVPSEaBtM_-8okC8rOUqO5j3e
X-Proofpoint-GUID: ibc3TvWmVPSEaBtM_-8okC8rOUqO5j3e
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WEQBSMOGI75ADZBSGLKXELNGC5KB525J
X-Message-ID-Hash: WEQBSMOGI75ADZBSGLKXELNGC5KB525J
X-MailFrom: prvs=7718adeda9=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEQBSMOGI75ADZBSGLKXELNGC5KB525J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 19, 2023 at 07:29:21PM +0100, Jaroslav Kysela wrote:
> On 19. 12. 23 17:45, Charles Keepax wrote:
> >On Fri, Dec 08, 2023 at 12:00:26PM +0000, Charles Keepax wrote:
> >>On Thu, Dec 07, 2023 at 02:56:17PM +0100, Jaroslav Kysela wrote:
> >>>On 07. 12. 23 10:55, Charles Keepax wrote:
> >>>>On Wed, Dec 06, 2023 at 06:26:17PM +0100, Jaroslav Kysela wrote:
> >>>>>On 06. 12. 23 17:46, Charles Keepax wrote:
> @@ -148,7 +148,7 @@ static snd_ctl_numid_t
> *remap_numid_child_new(snd_ctl_remap_t *priv, unsigned in
> 
>         if (numid_child == 0)
>                 return NULL;
> -       if (remap_find_numid_app(priv, numid_child)) {
> +       if (priv->numid_remap_active && remap_find_numid_app(priv, numid_child)) {
> 

This fix seems to work for me, thanks.

> >It would seem the primary issue is here, one needs to add:
> >
> >CaptureCTL "default:${CardId}"
> >PlaybackCTL "default:${CardId}"
> 
> Look for 'PlaybackMixer "default:' strings in configs for sound
> servers and PlaybackMixerElem corresponding values. Sound servers
> does not use the control API directly but the simple mixer API.
> 
> The LibraryConfig blocks are added to the standard configuration and
> there are 2 ways to use them.
> 
> 1) private configuration - _ucm####. prefix (only in memory for UCM apps)
> 2) blocks can be saved using cfg-save sequence command (used in
> ucm2/lib/ctl-remap.conf)
> 
> The second case - ctl-remap.conf - should save new configurations to
> /var/lib/alsa/card#.conf.d and the global configuration
> (/usr/share/alsa/alsa.conf) will include them. So the default
> devices should be modified. You may also prepare/test configs in
> ~/.asoundrc and then copy them to ucm configuration files.
> 
> Also note that the remapping is for the application side (API), UCM
> sequences are using the direct hw: controls.

Can I just check I follow here, you are saying it would be
unexpected to use the remapped controls in the ucm configuration
itself, only other applications would be expected to use the
remapped controls?

Thank you very much for the detailed reply, there is a lot for me
to think through there so I will try to go through that and
likely be back with a new spin of the patch in the new year.

Thanks,
Charles
