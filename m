Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E6537781
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 11:09:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13CC1933;
	Mon, 30 May 2022 11:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13CC1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653901795;
	bh=LyXFGXZ2REvicOPv+vuyNNowzqXJh39edklPjNtizJs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrcH/ePwvpHS0jnH50CWH/XMPzhcUbEJuN3YzCQb/6F8FblEKh1LDdoVLjE1ZODqF
	 P9cl9AgM29gA5dkbo59BvGsEkoqm6RdamyipHl1uf46vg1bxTTNtHPCjIb9YiL+/PD
	 OFLrugfaUBSzhZtbOHOYGPZbfM0wlBUmPA1WkNDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E35F801F5;
	Mon, 30 May 2022 11:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94545F80124; Mon, 30 May 2022 11:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 744ABF80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 11:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 744ABF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dcA8nd8e"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U6wBOD026011;
 Mon, 30 May 2022 04:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0nnOuY1I043AVIcqJp6idornjjCkVFno4tKetd4mjcg=;
 b=dcA8nd8emnmbSgN94gyFjds6JYlgsnV6WPdItTZqAGW1hPixBmwHDADeSUanEUz6SNHw
 X1CCccxXaGjE9DuhMsr1knSgyhYapF9Tz9VAa8ek7kqD8JHQSD0pVX1OKvTdpUqjKlZj
 mV5pUr8mhzidTHu7V56T67OqLxSJ7VQmJCAopr8Pe6j15RuAqOYRbxZBwerg3NFZXIcg
 2k5OFeUelpgCIEOVqNNmzh8L//7uzyUXTIw6sz3dG5xXPWx4pXkTOeY7Y9pfCNEevvvH
 0ioGmUifskKoDYMkHHUtuloND6a0ecd1PQO+o+TC6Yy/T3VhrkMMdqn/b/jxhHEc9YIb PQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51hk07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 May 2022 04:08:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 30 May
 2022 10:08:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 30 May 2022 10:08:46 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB8C7468;
 Mon, 30 May 2022 09:08:46 +0000 (UTC)
Date: Mon, 30 May 2022 09:08:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <20220530090846.GS38351@ediswmail.ad.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <871qwf0x8t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871qwf0x8t.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Mw2lI25xkuV3lPWIZ9LW5Vkodbz5fSRr
X-Proofpoint-ORIG-GUID: Mw2lI25xkuV3lPWIZ9LW5Vkodbz5fSRr
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, May 27, 2022 at 06:13:38PM +0200, Takashi Iwai wrote:
> On Wed, 25 May 2022 15:16:21 +0200,
> Vitaly Rodionov wrote:
> The idea to add / delete controls by the control element change
> doesn't sound good; as already mentioned in my reply to the previous
> patch set, the change of the control elements can be triggered too
> easily by any normal users who have the access to the sound devices.
> It means thousands of additions and removals per second could be
> attacked by any user.
> 

This I am a little less sure how we handle. I mean arn't there
already a few ways to do this? Both the existing ASoC wm_adsp
stuff, and the topology stuff (used on all new Intel platforms,
so very widely deployed) let you create controls by loading a
firmware file. Also within ALSA itself can't user-space create
user ALSA controls? Is there some rate limiting on that? How is
this issue tackled there?

> Moreover, the new controls with TLV controls don't look following the
> standard TLV syntax (type-length-value).  My previous questions about
> the TLV usages are still unanswered, so I'm not sure what impact this
> would have, though.  At least, alsactl behavior must be checked
> beforehand. If this is really device-specific (non-)TLV usages, it has
> to be clearly documented.
> 

The TLV stuff should be completely removed once my latest
comments have been updated. I don't think we need this for the
amps and I would also rather keep the usage to a minimum until
one of us finally gets around to resolving the large control
issues in a way that is more acceptable to everyone (likely
with a new IOCTL).

Thanks,
Charles
