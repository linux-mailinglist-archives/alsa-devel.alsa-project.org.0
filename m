Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346FF177728
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 14:31:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C753D1669;
	Tue,  3 Mar 2020 14:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C753D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583242305;
	bh=i9RqwM6qmLUgLwisKDlbxNh/xG8raK/Ik71Ml3+Qxvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMnHvzUYBx2x0OzEn4bfTsgKfE87YfnBh4PM4mOKVysB/IIfTqpNeDTZGl2XB+S1V
	 tnZIGWUgJtiY6yPbMDgyXWBQPF5UDWVTqfRY7qPhhMpgdGwHNOWLGQYgBJVKu0xq28
	 re1tl9EzS36rNm3laGcckhWRhYfKFJNDRYn9wYro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAB2F80266;
	Tue,  3 Mar 2020 14:30:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B45CF8025F; Tue,  3 Mar 2020 14:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64A0DF80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 14:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A0DF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CV1elQMg"
Received: by mail-wr1-x442.google.com with SMTP id h9so3376705wrr.10
 for <alsa-devel@alsa-project.org>; Tue, 03 Mar 2020 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hicGAyZ5CpHfmsbw4Kl9cPGuNpt8g32PuytU/UcEDL8=;
 b=CV1elQMgZLhBpuFfL5DjPopxXqFjooMD4nNFS/3zO/mg/Y0/qPPlbnp33SZup+b6Xn
 R0cE9JzQP4R+zgJnfJFQeNA7dybshykF3a2Ldu9qefqWJuiMHnZSFlgqQpSJtEsRyXab
 qAGDJu1tgLL/6+jZDbiLPhijElTtaRK5jMYuE82RT5dC2hH+bHvuAP9EdL3BBOjQkmxT
 IqqyonwLWKq58HGm6CL1MVGtHWy1+FBRHWDoYPPWKlVhP9gL8EQOMMNbZGEZrl7vM5RD
 qncE4ethqNSxzsEB357sbW5pZKYYUinUGRcUtKfY65TpSbFeZUURs1wPKt6vMXtGRShc
 wPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hicGAyZ5CpHfmsbw4Kl9cPGuNpt8g32PuytU/UcEDL8=;
 b=gYL80/yMun2pgqW6LlvacjWeS1FN+uLVOoYVgp13jRcoupqjtvwpez7SD2ud051bVb
 GsBAJE/V2brZFS20vNUEtAQjCwbaokvIWJh8Kf+Z1pCgqRi+lfDBHahuRgZaMz/EDUL8
 ZBvL94pvOgJjNVg38kcXG/lGyJ4vjXp3TclR6+Wcx8mST9+0zDHfaDlZ7zR+Wcw0C3W7
 Arr+lDHXQHdi8bA40SIVxBJ+FVF98bCE17eEkBLoDlTRfjiMvg/9vmN2VhRXmDfZqwrs
 X81pNHM71tT2Q6qqEl7/rv9WoqvwblU/PkrNRoLUSijngoWngznJtMNsI8HCVTh+Kj/D
 PznQ==
X-Gm-Message-State: ANhLgQ3q9qhVwjdjzwJfOCyWH8gv+VfjSPXnCeHZpvhqOahw3dH3YHDc
 vXPjaZvGHf22PmmF0t3WbRwGlRteHZFqX3ZwbQw=
X-Google-Smtp-Source: ADFU+vuFtNgxjbewAK+JcEL9uWLOVuASSCsfonI72+FgdQg4t/bXLC/G4KfOc+tj4z3cmF6C36Db39T7GycrQg3xlxQ=
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr5802969wre.164.1583242185866; 
 Tue, 03 Mar 2020 05:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
 <20200302205700.29746-2-daniel.baluta@oss.nxp.com>
 <CAFQqKeU8YF+aZVTafj3ZiPvNUsx3nK-8cdr8eJUm=_9_2TkRQg@mail.gmail.com>
In-Reply-To: <CAFQqKeU8YF+aZVTafj3ZiPvNUsx3nK-8cdr8eJUm=_9_2TkRQg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Mar 2020 15:29:34 +0200
Message-ID: <CAEnQRZBNMRNYOKwqweuZCeOYgMGh9DprRvz2ci3EOQPxqN3fhg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] PM / domains: Introduce multi PM domains helpers
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Fabio Estevam <festevam@gmail.com>,
 khilman@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Brown, Len" <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Olaru <paul.olaru@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>, Greg KH <gregkh@linuxfoundation.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, rjw@rjwysocki.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
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

Hello Ranjani,

On Mon, Mar 2, 2020 at 11:24 PM Sridharan, Ranjani
<ranjani.sridharan@intel.com> wrote:

>> + */
>> +struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
>> +{
>> +       struct dev_multi_pm_domain_data *mpd, *retp;
>> +       int num_domains;
>> +       int i;
>> +
>> +       num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +                                                "#power-domain-cells");
>> +       if (num_domains < 2)
>
> Hi Daniel,
>
> Just out of curiosity, should it be an error when num_domains is 1? Is it an error because the expectation is that the caller would use dev_pm_domain_attach() in that case?

NULL here doesn't really mean an error. It means that we don't need to
handle Power domains because as you said the caller
already used dev_pm_domain_attach.

Similar with this:

$ drivers/base/power/domain.c +2504

int genpd_dev_pm_attach(struct device *dev)

         / * Devices with multiple PM domains must be attached separately, as we
           * can only attach one PM domain per device.
          */
        if (of_count_phandle_with_args(dev->of_node, "power-domains",
                                    "#power-domain-cells") != 1)
               return 0;

Will update the description for when this function returns a NULL.

>
>> +               return NULL;
>> +
>> +       mpd = devm_kzalloc(dev, GFP_KERNEL, sizeof(*mpd));
>> +       if (!mpd)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       mpd->dev = dev;
>> +       mpd->num_domains = num_domains;
>> +
>> +       mpd->virt_devs = devm_kmalloc_array(dev, mpd->num_domains,
>> +                                           sizeof(*mpd->virt_devs),
>> +                                           GFP_KERNEL);
>> +       if (!mpd->virt_devs)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       mpd->links = devm_kmalloc_array(dev, mpd->num_domains,
>> +                                       sizeof(*mpd->links), GFP_KERNEL);
>> +       if (!mpd->links)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       for (i = 0; i < mpd->num_domains; i++) {
>> +               mpd->virt_devs[i] = dev_pm_domain_attach_by_id(dev, i);
>> +               if (IS_ERR(mpd->virt_devs[i])) {
>> +                       retp = (struct dev_multi_pm_domain_data *)
>> +                               mpd->virt_devs[i];
>
> Should retp be PTR_ERR(mpd->virt_devs[i]) here?

PTR_ERR returns a long but our function needs to return struct
dev_multi_pm_domain_data *.

> Thanks,
> Ranjani
