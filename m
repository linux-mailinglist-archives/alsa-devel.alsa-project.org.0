Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A3138AAF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 06:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB8715E2;
	Mon, 13 Jan 2020 06:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB8715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578893059;
	bh=Ta4mCDzCVeUV9fRlbPuFgNZbXCzrLzEgPyTsJ5rsQqY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpLcbpgcJosVfRYlOyLEcVniHct4urg4ahtyWFFWZR9b1E2FNsRAiQJN7tQw3asAu
	 Sy6ndsdriaggcw/7yXhiY2U9h1+YoI1HMAB52qKJaL+FA77mGDAsxMb59bKcXlkC10
	 prmrOLn/umQw5oUUu3pjD9swucWjgwbQ8f6oksFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189BEF801EB;
	Mon, 13 Jan 2020 06:22:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB6A3F801EB; Mon, 13 Jan 2020 06:22:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57F60F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 06:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F60F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sXsnWQlS"
Received: from localhost (unknown [106.200.247.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A93121556;
 Mon, 13 Jan 2020 05:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578892948;
 bh=pQmyxSK2rYvZKhrIwLap9VHfSzCEWZiVvINtuLhYf+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXsnWQlS74pdFu0UVzYxpNsBcF1pjQrjT5BtFxF/taQ3HDzM842jYOvVocHdIWHG9
 J+i7dHx1rmbqKaLZExA0iZN52nxNbefaz3lsNVHM25Wj2b8b0dwwoSCDmehmjB0IRc
 dXZyIv9yOCMRN0Vz0016AX+lCzyP+cCrTUAuhMIM=
Date: Mon, 13 Jan 2020 10:52:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200113052224.GQ2818@vkoul-mobl>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-3-pierre-louis.bossart@linux.intel.com>
 <20200110064838.GY2818@vkoul-mobl>
 <a18c668f-4628-0fb9-ffa0-b24cdad1cc8b@linux.intel.com>
 <69ad48b0-fa3c-904a-4106-5cd9bd18de5c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69ad48b0-fa3c-904a-4106-5cd9bd18de5c@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/6] soundwire: stream: update state
 machine and add state checks
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11-01-20, 05:30, Pierre-Louis Bossart wrote:
> =

> =

> On 1/10/20 10:30 AM, Pierre-Louis Bossart wrote:
> > =

> > > > -=A0 int sdw_prepare_stream(struct sdw_stream_runtime * stream);
> > > > +=A0 int sdw_prepare_stream(struct sdw_stream_runtime * stream,
> > > > bool resume);
> > > =

> > > so what does the additional argument of resume do..?
> > > =

> > > > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > > > index 178ae92b8cc1..6aa0b5d370c0 100644
> > > > --- a/drivers/soundwire/stream.c
> > > > +++ b/drivers/soundwire/stream.c
> > > > @@ -1553,8 +1553,18 @@ int sdw_prepare_stream(struct
> > > > sdw_stream_runtime *stream)
> > > =

> > > and it is not modified here, so is the doc correct or this..?
> > =

> > the doc is correct and the code is updated in
> > =

> > [PATCH 4/6] soundwire: stream: do not update parameters during
> > DISABLED-PREPARED transition
> =

> Sorry, wrong answer, my bad. The code block in the documentation is
> incorrect.
> =

> The Patch 4/6 implements the transition mentioned in the documentation, b=
ut
> the extra parameter is a left-over from an earlier version. This case is =
now
> handled internally. We did revert to the initial prototype after finding =
out
> that dealing with transitions in the caller is error-prone.

Glad that you agree with me on something!

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
