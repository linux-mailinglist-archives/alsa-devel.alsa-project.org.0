Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D246464F4E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 14:59:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D17DF255E;
	Wed,  1 Dec 2021 14:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D17DF255E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638367189;
	bh=6hXUZqTtjMHvMiLw80jH7XqKnNi56CVlYCUSmI2kDFo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j46dhtAxbtpsmC8TW8BV4yBl0RxJLziOa6Ha/bYF8syahaVZlXmcPPxWfI9pXjBMP
	 qbQ6LP34JR0MgPL9lX4EEuSk/9uVIWYPcBYHEgk3tliunHhP6lHlQbY5qLAhI8YJt7
	 pzSzw+v23RRMl/JDY8M4TqwxbtIx1aVEwJX81y9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4149BF80249;
	Wed,  1 Dec 2021 14:58:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3D7FF80246; Wed,  1 Dec 2021 14:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 635A2F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 14:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635A2F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="bFLburzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638367104;
 x=1669903104; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RwGEoCVnXeuIdi0DKi85KEVz8D3hms5pATzjSPRUszY=;
 b=bFLburzjy9HLC7VdCdJnSlFVk17B7wlrfPkm5F4xeaSaDW9S9NEtpO2h
 DDpuzCdfEixTDo/gyh90iaS6IrzN2sHa6vzLMx529PW6NI2/5xx3evjHL
 NbmAUzR5jkPWFzTWJOyH9HwuN03Y6Qt0WKN7JcoBsG2VVsgAmCoKiPSqP
 05zB+aCZWHYqpn0kSiJwQMdHWi2tv7VMGI415AkVb3zV24vVL/Cmb+u/w
 QaL69UpGlKRDkLO1yvuEiy5X8+tbicJe/dxveMFkfnNFQA9Pevlelyq7x
 qHSuRTMJC9pWFmSyIDe7i2T1dhdLh/Iu90ObQKe4LlN+Fz4/PxX1F4Ajv w==;
Date: Wed, 1 Dec 2021 14:58:12 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 0/2] Codec driver for TLV320ADC3001 and 3101
In-Reply-To: <Yad8CVmZKUDtpQaX@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2112011454470.30606@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2112011338260.1159@lnxricardw1.se.axis.com>
 <Yad8CVmZKUDtpQaX@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
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


On Wed, 1 Dec 2021, Mark Brown wrote:

> On Wed, Dec 01, 2021 at 01:43:54PM +0100, Ricard Wanderlof wrote:
> 
> > Changes v5->v6:
> > 
> > - Added missing "depends on I2C" in the Kconfig
> >   (reported by lkp@intel.com).
> > - Fold include file into source as it is not needed elsewhere.
> > - Fix SPDX-License-Identifier which was using a deprecated license.
> > - Clean up authorship information in file header, removing history.
> > - Remove useless GPIOLIB ifdefs.
> > - Use devm_gpiod_get for reset gpio rather than devm_gpio_request etc.
> > - Handle EPROBE_DEFER properly for reset gpio request.
> > - Use dev_err_probe rather than explicit EPROBE_DEFER checking.
> > - Properly check value from DT parsing for mic bias and codec gpio pins.
> > 
> > No changes to the devicetree bindings.
> 
> I had review comments on the DT bindings?

Yes, they were addressed in v1. The list above only refers to v5->v6.  
Perhaps I should have expressed the changelog in some other way?

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
