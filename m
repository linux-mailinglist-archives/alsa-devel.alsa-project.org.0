Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB611B97ED
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 09:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EEB1669;
	Mon, 27 Apr 2020 09:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EEB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587970893;
	bh=tQa8lkDTSXiJX97GClHGLKQ34P045c93GRDfYkb3SxI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoP+X7bYxI2v2k+Q8NxsZMNr4sD8ecUMTudrIjy/hjakFewrSze9wmcc6yGIADBos
	 AEYeLDyk6pdi91DD3AD2Odri54Ix+2Hq61Whpx/TiE3rSgqLYq6yoOrUX1MakeS3My
	 TMQmdIJkFgvUzMXMUK41REhvwAQZCIhdQXpTHcyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56545F80217;
	Mon, 27 Apr 2020 08:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F38F8022B; Mon, 27 Apr 2020 08:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5EE5F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 08:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EE5F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IL2IJv0C"
Received: by mail-pj1-x1044.google.com with SMTP id fu13so6466210pjb.5
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WNj7owPD+ZbRnStugkoSGfUDDLECau6V6cMguxLHseM=;
 b=IL2IJv0CwAvaTDLiqlc/43W1WRn+mgpJHcQ8lcGu5IP5LESVReGp34dPTQGf6e0LZa
 3rCwR8nNmXOAEkd7Qzy7NviBN1004OJr8Pb5pMjqmfp3qpJihUZhwd7nyTcdErdOInIe
 uT/acoJunK3/lzcWSYlr70GlAd1cL4+5aQRsO6ogXJBgfPAl7j9pz2uqOwVdBWbYe0q6
 lbHRELStH3w+8HvL6IraAq8odymfgvcnvKnG15I3pwiOqF/UTkx28z5RWu01Jb8zRX6u
 8N7Ya3TKyfDwMXJcwDdk6fA1JUwRLmFDLFLl41eCmhPhg6qDStbEFse06rD8j62TGsit
 h9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WNj7owPD+ZbRnStugkoSGfUDDLECau6V6cMguxLHseM=;
 b=A78N1uyEal/PeXbkmtyR4pW+767Pnq6kmzGvlO17B6CcmD/plJZFvzw2JxnYPMILBn
 NFaCOu6JhGHQ8EVgunOJcEmasKpxkk1G5pcjofPOw3ETzDN2mBYqLte8Ty9ERk/utHtQ
 cGEjUv8aC9q8/cy3Nkdv6Wfvac2IMCXHEnEMpANT4ssMfqXOCxlJxoqASlWJ1LFBXRVz
 F391lOGyzy3ePGQgbjJ8YQywODTi8KwpeO9xhMnr1l3zxrd77i/z2WDkuOxDVl4Kc2qp
 H+F1lMDAc7gmSSme8NqGN9iAa0p10mNkURBJmneYKcIBUPep8W9QOQPB1ozWwUvAXUwq
 +LNA==
X-Gm-Message-State: AGi0PuaRLHEEEldKGnhNZQwn+yeMOlrlJtdQ7IjpIuAvPMSrsWB+s1ya
 OkUuZv4u5u8vHKhTiD2/fEA=
X-Google-Smtp-Source: APiQypK642idgdGmw8QuDMMdid04wPSy9FsGffFOvsU2o0XwcfqVKE56jYsP/DglCL+LJ7YRbhEZMA==
X-Received: by 2002:a17:902:9895:: with SMTP id
 s21mr249837plp.158.1587970781619; 
 Sun, 26 Apr 2020 23:59:41 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 h9sm11317108pfo.129.2020.04.26.23.59.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Apr 2020 23:59:41 -0700 (PDT)
Date: Sun, 26 Apr 2020 23:59:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_esai: Disable exception interrupt before
 scheduling tasklet
Message-ID: <20200427065934.GA2236@Asurada>
References: <a8f2ad955aac9e52587beedc1133b3efbe746895.1587968824.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8f2ad955aac9e52587beedc1133b3efbe746895.1587968824.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Apr 27, 2020 at 02:23:21PM +0800, Shengjiu Wang wrote:
> Disable exception interrupt before scheduling tasklet, otherwise if
> the tasklet isn't handled immediately, there will be endless xrun
> interrupt.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
