Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C7157CAF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5831676;
	Mon, 10 Feb 2020 14:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5831676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581342385;
	bh=NS9OzfcyLn+lEIgglKX5l8LeTfQJ+JpO1Ca7SsEmIwg=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DfR67QQQdPmuB3NVP9NVagp464+E+qA6w3q1rogSe7ko5AarKipIIjgd/i6oIBS7r
	 +72VizDwsLmVaqPfsdOPM7jigmMrxXQ5hvHvVpi71cVn+SrkCJTiCWB/KJeGfHJVKu
	 esZTiLUe4IJNBzWMaor7HgnastCy3NZjI5H+BBKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB43F80118;
	Mon, 10 Feb 2020 14:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E05F80157; Mon, 10 Feb 2020 14:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18FEF800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18FEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="vvcUgFrb"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 0DB0AD006F9;
 Mon, 10 Feb 2020 13:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtK7mfW-1BDu; Mon, 10 Feb 2020 08:44:31 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id B5D6DD00693;
 Mon, 10 Feb 2020 08:44:31 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com B5D6DD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581342271;
 bh=zoaUdtUdAwbS6W/qIOBURXTRFBcaTr0B8ofCyG3hjjw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vvcUgFrbvvVbBiV8cAwNiGEhy7uaAKlWb93nxC7EAozNJol/8FnH6LclBYzz9RWM3
 Gch97PXEEO9SY26Glk7blM68U4i1+UL1IieXWRg+6pm31uNkDVPlz2HortA8N5H61H
 2wKj988HcHOKIs2dJMG/uu5MraB0px8kCJo2J72E=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 08:44:31 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200210121747.GB7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200210121747.GB7685@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <007098fa20e161bf94d65e248955ff6c@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 0/8] ASoC: qdsp6: db820c: Add support
 for external and bluetooth audio
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-02-10 07:17, Mark Brown wrote:
> On Sun, Feb 09, 2020 at 10:47:40AM -0500, Adam Serbinski wrote:
>> Changes from V1:
>> 
>> 	Rename patch:
>> 		from: dts: msm8996/db820c: enable primary pcm and quaternary i2s
> 
> Please don't send new serieses in reply to old ones, it can make it
> confusing what's going on and what the current version is.

My apologies. Its my first time doing this. Thank you for the advice.

-Adam
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
