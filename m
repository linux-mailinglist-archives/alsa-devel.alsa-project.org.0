Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E44650F8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 16:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792AC25B4;
	Wed,  1 Dec 2021 16:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792AC25B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638371419;
	bh=iGvyVNeshu/8b8+8hat1t39hznxnfHgLyRF1JAYtbko=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRjDhZkA7G2ujDLbwOgiZGNTzYtZFsTqsW5fBs2m9Yq7T4w1ENp279uMcTPui/Pav
	 uytMV2xOYS34uE7cz6dUETp5CKOvpFEgFr1tdHPtRQPDDxrT5Xf9eeGKHz56PQVfJI
	 GIa7Tfh+d2CoVNm6SdpbiKdRp8nziRanyMBIlWlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D66F80121;
	Wed,  1 Dec 2021 16:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9993F80246; Wed,  1 Dec 2021 16:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76392F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 16:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76392F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="UEKYvnRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638371336;
 x=1669907336; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=IyzzGWlzKAXwqc+qc3u4pYga8XTqhHA9jBEig8JEp14=;
 b=UEKYvnRDftG0IraY/4J2kMaqjCosrhxtXjUA9E7hXTwxxtf61SkWDLrb
 egSENw57365TDfRcY0FMIqlHEu5besyW/JQSvg2+AE8H3KF1dj+kf8oI9
 H7AxxXxX9EpCM58KWC14sGlmGzYLhyvwxDQwCfCyhhz7svDcfzt511ELV
 uy2/x9Ii5zCwSjCbdAmK9JE5+msZUjRZ4SGuPmk4/4vtpGDK7Jy0tzvy0
 2A1la7WJ0RGWaUp3D2REEiKl+Rng17miUahq/yWamJbwkJomADmnj0Emp
 RV6ctHkJ3M+NovAICQnWVBZVY3GIyzS4gOeGJPUr9AXiBGSUQT4wBGwqB g==;
Date: Wed, 1 Dec 2021 16:08:43 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: sound: tlv320adc3xxx: New codec driver
In-Reply-To: <CAL_JsqLLeSRKmjowWdSHLBiewChRjVzvEn0M3t4_MA5GtAvkZw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2112011606390.30606@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2112011341340.1159@lnxricardw1.se.axis.com>
 <CAL_JsqLLeSRKmjowWdSHLBiewChRjVzvEn0M3t4_MA5GtAvkZw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail05w.axis.com (10.20.40.11) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


On Wed, 1 Dec 2021, Rob Herring wrote:

> On Wed, Dec 1, 2021 at 6:44 AM Ricard Wanderlof <ricardw@axis.com> wrote:
> >
> >
> > DT bindings for tlv320adc3xxx driver, currently supporting
> > Texas Instruments TLV320ADC3001 and TLV320ADC3101 audio ADCs.
> >
> > Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
> > ---
> >  .../bindings/sound/ti,tlv320adc3xxx.yaml      | 137 ++++++++++++++++++
> >  include/dt-bindings/sound/tlv320adc3xxx.h     |  28 ++++
> >  2 files changed, 165 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
> >  create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h
> 
> DT patches need to be sent to DT list for automated checks and to be
> in my review queue.

Sorry. Will resend this particular patch.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
