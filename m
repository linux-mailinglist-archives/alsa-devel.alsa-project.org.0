Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9B4D2C46
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE63417B7;
	Wed,  9 Mar 2022 10:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE63417B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646818716;
	bh=N/AKDvLQ0OGYmZMpA8KJWBv1aYch5tZHcHJFLL/YDwY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PICnC9NdLgQmUYxjJyVYwgZtnkt7JMTkuuJ9Kq6DdWDMMzuQ2wHQ4bX3Txra4XO99
	 ds3hydxVLxlUaImLq2ZPwJzVXQMRFPPfp0MiuudiGLCPrbUYUpbPGh/1d8J+pKDr65
	 e1rXG/aFmFnrP1sP95wr1aH6xDDXSw99NcY1W+yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F123F804AB;
	Wed,  9 Mar 2022 10:37:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC8FAF8028D; Wed,  9 Mar 2022 10:37:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F00B7F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F00B7F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="U7JUVZib"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2297boHB006265;
 Wed, 9 Mar 2022 03:37:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=d6oIGV5ctSHUZQyktQOGy+QNmd6WRd8LohDDntkaVeI=;
 b=U7JUVZib4SRjbqBEgOSQ6eFoA1otkUJqfXHFfT/p8wycwL/33lv5I7S8zI+a6CZDHqXw
 7Rdu6Kt2k6+k/bwmujk0DuBZ2HIlqE3MQ0UgHXIkcLGLX4ix+HLWKbvYIQrnIbxoFdr6
 ifEymmdCUsEWmpx/9cyyaxHx6rJNKjwYzlUvH/AOf7Jz28qtykzwDN9NFdkiEXdJO+4u
 1Hva6wgopSdRVSocwUHltVhVfK5JrE6XIXghustKjXp6NEmhz4CPXByi+jNL3uEzNsU9
 2zFY+HUfiZzVvnwpSsrwR76UZBti7uKR8NJj9TWRiCestKtQFlvTtQHJ3WGdCXYrX23m eA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3em55swe4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Mar 2022 03:37:24 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 09:37:22 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 9 Mar 2022 09:37:22 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BC8BDB06;
 Wed,  9 Mar 2022 09:37:22 +0000 (UTC)
Date: Wed, 9 Mar 2022 09:37:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v3 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Message-ID: <20220309093722.GI38351@ediswmail.ad.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220308171730.454587-16-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 6HkZvwNM2aINEgKd1u0XyORUQSla4DMr
X-Proofpoint-GUID: 6HkZvwNM2aINEgKd1u0XyORUQSla4DMr
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Tue, Mar 08, 2022 at 05:17:29PM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
