Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E980398802
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 13:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB3F616EC;
	Wed,  2 Jun 2021 13:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB3F616EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622633010;
	bh=MqXDtf6du2G6tahZhHvuFjEECf6FhWiidhj778CGFfw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/RBkLQm/yNpLaOLcPh33EHIjgZ+FgiswHEmZgtmNrYYW3vWBd3JKR9hPR3lRTudz
	 8AJ1hcqk0gYbtoe3Q5hshSPMQZQMgNlu4Bm1JCL/KCvMBSwv58tmXc14hRANcRjbgA
	 V6qbvDn1kxIk3GLgU08+ATDD5sNEpqR1NuvpvGpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4FBF80424;
	Wed,  2 Jun 2021 13:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A18F4F80424; Wed,  2 Jun 2021 13:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3FDF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 13:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3FDF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Oc7ikm7L"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152BD04M009111; Wed, 2 Jun 2021 11:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=4WZOMte/qqiicAT17+QJ/9Dyj4tQM7CDtLX7HNMwc4Y=;
 b=Oc7ikm7LnPMHxB6gRvHktaqW1OJ9L+Yc/s5GG52vWB+IbhZDudEbuE7fSXzEL9NYFDUC
 AWtZh4sNJwwxuwsSpXT1ZNpubdgnkMmEK+4JnA2E2Y/6ieEQMTBLQeaH8FqNKecBCCSK
 X2S5kJaEpC9NrKjMaXgEm2yj3kJ9voHvK0XbH/NZ3YJLxyOkIe6+9TvfP+WMBvfI/H+p
 gZqy81kQjk8X9abqoYJKeFRqS2GaRxWHADJZMRCY8A+3eNgHzaciqPqX0x/cH+J00QDs
 EYeUcmn1LGzwR72lWjvAFIYQNmVBXOfO+aGq1T+LWK5wzWrKHxn9ajE45CDwMNOWBeSB dA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38wu57r8md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 11:21:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 152BGCVL002916;
 Wed, 2 Jun 2021 11:21:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38ubndx52t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 11:21:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 152BLnD4010736;
 Wed, 2 Jun 2021 11:21:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 38ubndx52k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 11:21:49 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 152BLiKI021204;
 Wed, 2 Jun 2021 11:21:45 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Jun 2021 11:21:44 +0000
Date: Wed, 2 Jun 2021 14:21:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: rsnd: check for zero node count
Message-ID: <20210602112135.GF1955@kadam>
References: <20210602103722.12128-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602103722.12128-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: A29s0bsNRcWZ5loyWTZ8SHAlo2qIGlhL
X-Proofpoint-ORIG-GUID: A29s0bsNRcWZ5loyWTZ8SHAlo2qIGlhL
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Jun 02, 2021 at 11:37:22AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to rsnd_node_count can potentially return a zero node count
> so add a check for this corner case. (Note that the two other calls
> to rsnd_node_count in the kernel perform this check, so I think it
> justifies adding this). This avoids using a zero nr in a devm_kcalloc
> call.

I don't have a problem with the patch, but really the code works fine
as is.  A better commit message is:

  Most callers of_get_child_count() check that "nr" is non-zero so it
  causes a static checker warning when we don't do that here.  This
  doesn't cause a problem or a crash, but having zero SSUIes (What's
  plural of ssui?) doesn't make sense either so let's add a check.

regards,
dan carpenter

