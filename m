Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C750D746B5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 08:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521FE1737;
	Thu, 25 Jul 2019 08:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521FE1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564034523;
	bh=xCuI3NH8Pc8zAJbFPabV/jMBSxYViP1yzU8S8hTJXjw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gg0Y0YTdQDJAqq5gXtyOjKBOfrGI0MeszL6VzfyApJKBzC6pEX8sKxJSHGKPSAY5I
	 WHHOvqFsm3h7Pd8pNhJBk7TKaT0X/HQw7ex1UNUDRvwvjuwrXJwv/VnKq1VTtkvvMs
	 cXhO6eZMzl2IPphATirkubUP1DMbwqMawtz+VBkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B659F80448;
	Thu, 25 Jul 2019 08:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D6AF803D0; Thu, 25 Jul 2019 08:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1A0FF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 08:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A0FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ucy7l0PI"
Received: by mail-wr1-x443.google.com with SMTP id g17so49319674wrr.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 23:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwJcmk5yiFlme1u00/d80HZseBmnYpsKoUulVK5QiqA=;
 b=ucy7l0PIIgkVo6/HBTwEDgLsRwwNI/lHafiIlrF8pPx7QPRJllYj0UOJJMhSd7jP8U
 ytYcFqO1GLhsEkK1yF12onQ5WPdq4tyGgROGVIBwcIVzRNsInv64PHIK8d3xRK1R9qWd
 gaAm5kNOsy2Wvp6AcpDlYFC07uW8JmWj8mw3vuys/hM0wWxJXx0KS7eWKCOwkeFrkRjk
 K6wY1G7XP/LqsRqt4TAcHWSSFJiOSQFt+jh8KDBCbPhocAtic193G1R638pZcv9Yt+WM
 dvLt6KH6BF48BHGOlRqvqBqxdXnMXorYX5qOvN0vaWqYn2bsdu/RKqQZPwmzl45tljMD
 HDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwJcmk5yiFlme1u00/d80HZseBmnYpsKoUulVK5QiqA=;
 b=FxeKvsLr5tyo8B8+ey+aIMOzJsFvPX2vN46Ki0v0tpJs9vUsELJyEIDDQt1ck/2zjk
 cJO6DMpmnx8I7iY4rBc5Vi6rIk6n9UjCQsCQHuIJjH09lETa9uJpQEkyaLU1xqFM0izV
 rEZ6FD9PsZja86aJMe6VqonBZfrIP0o2WvF41Qpbkul4jNU/55fceSk8hApOVecNLOFO
 /oEpIoJMb/Q1+/1VL02+Ewc7zrgF1nYbXGbquwhRgBW1OPShOWjl87+uFKA0M6XyHSCy
 uPmqUTwsIwVqqE29ng0XiWw2eQHOTM+E9hNSXFQHZMF3jXFBMOZLz+fjoIVRI4HV7iLV
 P7YA==
X-Gm-Message-State: APjAAAVP68CAMP9y9BpPUENgsBBncIGE8bQq+fUid2ldhi7ICMqlgClr
 ZLa+YzP0yawz24eloRgI7Dti321dPbJ8XBPVCRc=
X-Google-Smtp-Source: APXvYqzMQe4AbvN+dLqV0ii4ui6djRNNceKLvVW0FznYpmDPAHgEgKVrzpvWCeklkVcneU/eivkYc+c51aZguQ7gVQU=
X-Received: by 2002:adf:db46:: with SMTP id f6mr41138857wrj.212.1564034412867; 
 Wed, 24 Jul 2019 23:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
 <20190724223422.GA6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724223422.GA6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:00:01 +0300
Message-ID: <CAEnQRZDtAwAWn+fEWcfiXROc+X5bhwdas=R=JdizcfPjyFSv0A@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 01/10] ASoC: fsl_sai: add of_match data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 25, 2019 at 1:34 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > New revisions of the SAI IP block have even more differences that need
> > be taken into account by the driver. To avoid sprinking compatible
> > checks all over the driver move the current differences into of_match_data.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>
> Looks like Mark has applied this already? If so, should probably
> drop applied ones and rebase the remaining patches for a resend.

Yes 1/10 and 2/10 were already applied. Will drop them from next version.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
