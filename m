Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6640191D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 11:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0314E1761;
	Mon,  6 Sep 2021 11:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0314E1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630921491;
	bh=7iA2KMvYq51zqbci+7IiPHF8tL3EI7Uu8JaLweyqLdU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyFmgNIk9X8BnUsbzY2vDmviEi9U71emWbE6gU0SH7EWS0DKiZgu/5n0wKOsH8Zdr
	 Wpe6sMRniBV74hEIrdd53lmjEiKZzoLHMLNc1Jpti/BTDTGCuFXTlztPLJJ3vwxaFn
	 1jUvWZRaitSNR3sePEqdPEcg0nGhO39ZDqqOYYYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6255AF804A9;
	Mon,  6 Sep 2021 11:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D44F802E7; Mon,  6 Sep 2021 11:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFCB5F800C7
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 11:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFCB5F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CYvGNbPU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1868w4eA023997; 
 Mon, 6 Sep 2021 04:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PNuvl74OycQmn4qsID29rRVK9hZv57HFzKWwcS+78Ow=;
 b=CYvGNbPUBA3eY6Ysj8TyyrzTqEytN1+Idhp8hbo7tmZe9vyimwAzmQBXhhadZaolQcKU
 QhAiMZtGehOWsUb31VezpK/NVTH+eLbv4+pwq/x26eeduWg5xITKSoaD+5pQXM2f6tqS
 sCJ6QtFqX/qQqAartJFzF3E+RwtqCdc7WlJ6pGDhVzJnmGDRXzf2iptOPLfA3jOGh9j9
 wusSnewDIaFPEW2+2+REzYm4tfwrIrecUXICJTbGaU6RHqaja1J4L/Obhe1k8ZxQt6wX
 +F1m04ALKrVrwC/WO18OlD9zPDrR+nDKij/LD7bq9N4JJCQyHywxdyapQtFUaUHbwppn 1A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3aw22mrkv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Sep 2021 04:43:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 6 Sep
 2021 10:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 6 Sep 2021 10:43:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 389ACB10;
 Mon,  6 Sep 2021 09:43:22 +0000 (UTC)
Date: Mon, 6 Sep 2021 09:43:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v6 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210906094322.GN9223@ediswmail.ad.cirrus.com>
References: <20210903212659.2011303-1-drhodes@opensource.cirrus.com>
 <20210903212659.2011303-3-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210903212659.2011303-3-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 8hHu3bRqby1MFexUyRE6CjusQjwL_Y13
X-Proofpoint-GUID: 8hHu3bRqby1MFexUyRE6CjusQjwL_Y13
X-Proofpoint-Spam-Reason: safe
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
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

On Fri, Sep 03, 2021 at 04:26:59PM -0500, David Rhodes wrote:
> +  cirrus,classh-bst-max-limit:
> +    description:
> +      Value set to the BST_CTL_LIM_EN field.
> +      A value of 1 will limit the Class-H voltage to the value in the
> +      'boost-ctl-millivolt' property.
> +      0 = No Class-H limit (default)
> +      1 = Class-H limited to 'boost-ctl-millivolt' value
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    minimum: 0
> +    maximum: 1

There is no boost-ctl-millivolt property however. Apart from
tidying up that loose end I think the series looks ok to me
though.

Thanks,
Charles
