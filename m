Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B833280789
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 21:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 080161AB8;
	Thu,  1 Oct 2020 21:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 080161AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601579369;
	bh=ExLBEjOkPAKZY4CTfp2wxnMR3zRyIOPgeBy2wLsMIwc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdzYlrPww2F/v6+SmuBLQdnZDqSQwQq/CRSwVbIVWTx5xTaC1KM+uy8S5FkVJ0va+
	 EXUV9zgCkxAqYriq0q72Co0Ip2jCzXi9Xe7gENeXZYQ45cyIQ45UYbkAAp/pSbJv7G
	 J66fZgLn3V4H6gUInxfzX8hzAFZuMYFKBDC44VRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD5DF8022B;
	Thu,  1 Oct 2020 21:07:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A736F801F5; Thu,  1 Oct 2020 21:07:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F500F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 21:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F500F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="Sz0EJjwT"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4C2N130q5Sz5q;
 Thu,  1 Oct 2020 21:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1601579255; bh=ExLBEjOkPAKZY4CTfp2wxnMR3zRyIOPgeBy2wLsMIwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sz0EJjwTa3tpON/hc29MK011y7SJzcSEjSyox5yA0zDnMshZbLRdXUNtNrf1oD9Gm
 eXEe81ZubdIS21bxDS3RrZCBA56PYrEl01+WwktudpPIFpchHzRRPkYadPuJAGTyK6
 hiUJGX7vDXRSrEVpLPKJ9VR75Y5JbkdhKl2pVRsvr8lEEzYlfAja5i8mdLZjhOfRAt
 LhG6hWKoD4JppKejIzmviNnNd1R/KuSKgC0zE9VRTS8fx/+2y7up1rm0eJ7R3dalwp
 2bMLEgnLEwNkJkKxOClp32SPe0e7fQOj/V/IsmwV8yCGmwdSO/ZS8sl3EIuaQrSiJV
 3UQZFvsDsoHiQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 1 Oct 2020 21:07:33 +0200
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
Message-ID: <20201001190733.GD23339@qmqm.qmqm.pl>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1601573587-15288-11-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, atalambedu@nvidia.com, tiwai@suse.com,
 thierry.reding@gmail.com, rlokhande@nvidia.com, swarren@nvidia.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 nwartikar@nvidia.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, linux-tegra@vger.kernel.org, mkumard@nvidia.com,
 viswanathl@nvidia.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Thu, Oct 01, 2020 at 11:03:04PM +0530, Sameer Pujar wrote:
> Add Tegra audio machine driver which is based on generic audio graph card
> driver. It re-uses most of the common stuff from audio graph driver and
> uses the same DT binding. Required Tegra specific customizations are done
> in the driver.
[...]
> +	switch (srate) {
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +	case 176400:
> +		plla_out0_rate = chip_data->plla_out0_rates[x11_RATE];
> +		plla_rate = chip_data->plla_rates[x11_RATE];
> +		break;
> +	case 8000:
> +	case 16000:
> +	case 32000:
> +	case 48000:
> +	case 96000:
> +	case 192000:
[...]

Do you really need to enumerate the frequencies? Wouldn't just checking
srate % 11025 be enough to divide the set in two? Or just calculating
the PLLA base rate by multiplying?

Best Regards,
Micha³ Miros³aw
