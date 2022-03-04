Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A974CD1F0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7511929;
	Fri,  4 Mar 2022 11:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7511929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646388223;
	bh=1vfLAMYPOQN7noKAmpmZg1EtFbN2Jq1/bx0pAMCI2As=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gc/mJbX+ZN/2fUMa+j2HSFaf5ZUyJ9MVWqTLpP6wJQofni/prJ6sila0iuL29WGbJ
	 ETCtb1i88mTqd7L7ntcPflsMKacAhsLApiOcTtUdgk771H3pjJUGu33hUv67WCe8z4
	 aqKfXCa5YcTfW+iKydQw+fSNoSMxk2FC/NbFSbnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E65F80516;
	Fri,  4 Mar 2022 11:02:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F52F801EC; Fri,  4 Mar 2022 11:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37B8F801EC
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37B8F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EL4qoVnd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2245Ulvb018989;
 Fri, 4 Mar 2022 04:02:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/fHFiGE2UgcbICzvteVz8HdkQH7m5kkhBu6ZmDHQErk=;
 b=EL4qoVndQtUku7OA38zzwGZx8cGDEFvsjMaq4+mQYqAQZ6S+zohDl/CQMDuMnAk2SPz6
 xjviRLnK5r/NEUFZt3Xi2jcGggEDw8PC408Lfw4ZMRZLcv/uLFTFxeIrCSg2f47kJubs
 66ej86LZowSdMU+KZidLlzJ/CK3FwTcMzxTge0Sunzw9UWfoLFxsiai2TTkT6Kfx2rPv
 UsuX62QISDExBXcuQex9J5XDok65otCteoMpn7cqIdVPUZwozjWsuBl4AB1I+eIHkdhE
 2sxsSaQXYKdSeFEn6qGDYw+vBX882TncG68f0wkgWjB0ikItksy5GIqq1XYRPNfgOHun dQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j1rs52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 04:02:31 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 10:02:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 10:02:29 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9A0AB7C;
 Fri,  4 Mar 2022 10:02:29 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:02:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 03/20] ASoC: cs35l41: Fix DSP mbox start command and
 global enable order
Message-ID: <20220304100229.GY38351@ediswmail.ad.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-4-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220303173059.269657-4-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 9gXXiq8gVPtNH8vfxdGQgA-V6iLqwbls
X-Proofpoint-ORIG-GUID: 9gXXiq8gVPtNH8vfxdGQgA-V6iLqwbls
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Mar 03, 2022 at 05:30:42PM +0000, Lucas Tanure wrote:
> Global enable must happen before CSPL_MBOX_CMD_RESUME command
> is sent. Move it to PRE_PMU as both events use
> SND_SOC_DAPM_OUT_DRV_E macro.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
