Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E174CC372
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:11:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD6518F4;
	Thu,  3 Mar 2022 18:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD6518F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646327472;
	bh=EZ64RrLAufcaTfxOU8QnB6umg8UYTEL5J9ra8Ckkkn8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vaU5aQeRXCZms5f4LQsGTxUr/ZxUocj7iqFmqk9SHf16TzLZdskDDe7ncVUb4+NxC
	 J4Uan2FBp9NLjwIr8ckQ0Fu63fQXp6mbfcqA7+a5KqYZzKmAgbzzF4q3606gRxK7pH
	 SHu7EihwCtSzOm+W/11BBzNTQAXZerV1t5MKG1Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 352FDF800F0;
	Thu,  3 Mar 2022 18:10:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA119F80152; Thu,  3 Mar 2022 18:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC2A1F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2A1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qmd1yQHr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22385YKu022391;
 Thu, 3 Mar 2022 11:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=sBTx+Sb/4DNav975t+tA9y9v878xAq0yu9TI8CLTbDc=;
 b=qmd1yQHrdxJjir+tgeUEtTYne1r1QkfzfXPZfiLmbyATWwvR5qfKmn1ju+237HM7GdH3
 y+UPjKGa61WBdwFF5Xax5HYDZy4aB84Bl7Pi5XOydD9r25g1Qq7HJdgIl0jlEYs0dNn+
 qCDDI6/y0tJJMCAVpTndzF6/r4S1ZeGJ9wmBKm8TG0DNqaWydEhtRcpBPMptpd+xn/6n
 4HxzbuZkPAVTmRNJ05jmyj+58mUtGeiQcWOuQ8wEyDl58HFFE3A1TFHuALi+c/mZsOru
 HkbqE7Ru4iOFIzgs1yK5AMWKV15iVnWWvP0T2CUwTkEf7E7Q8pwVX8Kp20D51Lxqq8sO bg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ejsv20pne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:09:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:09:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:09:50 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EBEAD7C;
 Thu,  3 Mar 2022 17:09:49 +0000 (UTC)
Date: Thu, 3 Mar 2022 17:09:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Expand firmware loading search options
Message-ID: <20220303170949.GR38351@ediswmail.ad.cirrus.com>
References: <20220303155016.122125-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220303155016.122125-1-simont@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: SsBYKiKjvpqxnUz1WRs4hYWDISr14wwM
X-Proofpoint-ORIG-GUID: SsBYKiKjvpqxnUz1WRs4hYWDISr14wwM
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Mar 03, 2022 at 03:50:16PM +0000, Simon Trimmer wrote:
> The parts supported by this driver can have product-specific
> firmware and tunings files. Typically these have been used on
> embedded systems where the manufacturer is responsible for
> installing the correct product-specific firmware files into
> /lib/firmware. However, the linux-firmware repository places all
> available firmwares into /lib/firmware and it is up to the driver to
> select the correct product-specific firmware from that directory.
> 
> For example a product containing four smart amplifiers may provide
> firmware specific for that product and each of the amplifiers may
> have coefficient files containing tunings for their placement in the
> mechanical design.
> 
> This change extends firmware (wmfw) and coefficient (bin) filenames
> to be of the general form:
> 
> <cirrus/>part-dspN-fwtype<-system_name<-asoc_component_prefix>>.type
> 
> Where the cirrus subdirectory, system_name and asoc_component_prefix
> are optional.
> 
> New files will be placed in the cirrus subdirectory to avoid
> polluting the main /lib/firmware/ location. The generic name must be
> searched in /lib/firmware before /lib/firmware/cirrus so that a
> generic file in the new location does not override existing
> product-specific files in the legacy location.
> 
> The search order for firmware files is:
>   - cirrus/part-dspN-fwtype-system_name-asoc_component_prefix.wmfw
>   - cirrus/part-dspN-fwtype-system_name.wmfw
>   - part-dspN-fwtype.wmfw
>   - cirrus/part-dspN-fwtype.wmfw
> 
> - Qualifications are added to the filename so that rightwards is more
>   specific.
> - The system_name is provided by the codec driver.
> - The asoc_component_prefix is used to identify tunings for individual
>   parts because it would already exist to disambiguate the controls
>   and it makes it obvious which firmware file applies to which device.
> 
> The optional coefficient file must have the same filename
> construction as the discovered wmfw except:
>   - where the wmfw has only system_name then the bin file can
>     optionally include the asoc_component_prefix. This is to allow a
>     common wmfw for all amps but separate tunings per amp.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
