Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665A241A20
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 13:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13831666;
	Tue, 11 Aug 2020 13:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13831666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597143970;
	bh=cCgrk9TPuvbYs4UoP/71ihEu3FGORv8rSn0s+PU8D50=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BooUzjGvs1t3YSR9g/+agxXnGnsuKzzgV18njcY5Z1KRFcOURA4dnjiC9qruV+KiD
	 AP0ux9zFaEOesW/NsPzHXhwSSEj7SkoF2SqOdS5lLGZVkCbvJFYwDlhRCgqMmf2ZNa
	 cG5oWE/q/srk4hrG/5mznxMsdpwNPn0behHV3NJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E853AF800D3;
	Tue, 11 Aug 2020 13:04:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2587EF8014C; Tue, 11 Aug 2020 13:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDEE4F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 13:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEE4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="d5H6E6+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597143864;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=zmGqtyvDjnPl9SF3eHck7clcf6r4U0VaDRO31hZb3o4=;
 b=d5H6E6+xioQHUWuGUTsAbtpplFjuk/+hDVSAQ4JaHLf8KvwniPaxjFdS3F0xrzes41
 ECx3B0j/ky3R36bTH1dFMoCUVcf7063o9IYum5LRY6qRyF3rzIzudUXobJhl3eBYbZ4M
 oY/p2cxtyfo7UhgzP/i+FzW7SrHgrsd0ClFJGw6PQYNP7kmjdTTYXBi/aWJiTCS5RSUe
 kXXFnmeKh5YdF9/7rqEDJ9q5RsVKnr4iEo7MCQSqR/Yx6VOKYDq6hEytQ9b6nQpdPgrz
 6Vxu6HSkB7m3akq/UWSwAcF5TebP237a0Im5PrmycmgyZ9sughF6CZuZRYeuPthqoDZp
 scRg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew7BB4HjIj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Aug 2020 13:04:17 +0200 (CEST)
Date: Tue, 11 Aug 2020 13:04:09 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: q6afe-dai: add dummy register read function
Message-ID: <20200811110409.GA1481@gerhold.net>
References: <20200811102552.26975-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811102552.26975-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, john.stultz@linaro.org
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

On Tue, Aug 11, 2020 at 11:25:51AM +0100, Srinivas Kandagatla wrote:
> Most of the DAPM widgets for DSP ASoC components reuse reg field
> of the widgets for its internal calculations, however these are not
> real registers. So read/writes to these numbers are not really
> valid. However ASoC core will read these registers to get default
> state during startup.
> 

Actually q6afe-dai does not seem to make use of the register number.
The DAPM widgets all look like

  SND_SOC_DAPM_AIF_IN("HDMI_RX",  NULL,   0,    0,     0,      0),
                  /* (wname,    stname, wchan, wreg, wshift, winvert)

Wouldn't it be better to replace wreg = 0 with SND_SOC_NOPM in this case
so the read/write won't happen at all?

q6routing on the other hand does make use of wreg, so this would not
work there...

Also: If I remember correctly the ASoC core will also attempt to write
to these "registers" when starting to play some audio, so you might also
need to implement component->write().

Stephan
