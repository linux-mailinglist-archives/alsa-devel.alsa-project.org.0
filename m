Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2300522C65
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 08:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2C718F6;
	Wed, 11 May 2022 08:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2C718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652250859;
	bh=zWsCGmP2DGGa3GicmdDzItcOP3/S01gSyxJdjV9P/AM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ng6KPMqAV07iQI+SJNvmiRkH6jf+/YM4ESoCIcDUG92dB6/RuX5lWt77iQUnYRotk
	 ClM6xonwZ/QEIqHu2fWCksKF1Cd/lOQjWlUMGc34yolm8qyOs+7X2xPiyaf9zA1VQ3
	 XW1GiU7834wIdQ14YUk2rWlwYo2iVnMqOVGznFyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D13FDF80116;
	Wed, 11 May 2022 08:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0D4F80137; Wed, 11 May 2022 08:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODYSUB_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B001F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 08:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B001F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VpTpXlvW"
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so1655215fac.12
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qpe82lv//osHQsKtRM4t4l6sK1m0Za0PaK0Vr4fdyoY=;
 b=VpTpXlvWdvxVO9uQItXsBt9dJ2gkW3BJaT8RVJLZy56A48Rms7T+b+KBdbXX3IMjqP
 rlBDz8Y3QWW0pd7tYu/3W1/Jc4AY9g5HIaNE0mhFqnFBxBQL+QvK/++d5+nVorGAC+f6
 8L6r1t16frTxUnuE9Cgps4Ooccv3s/k4xrm8KL/m38otmObFp5vKvfRHW2tWFh25EWu4
 XHIO+lUYMYihi85KUFseAbdPBnBUE/FQsCpWiPE9YCNRuwIfn+hHpZ0jyy5IQZckbMsT
 DBVn5fZU7Eu9AY1FcdkubxmWPnKsnJDNBOouZFx8UGTekcOhnV4VnNapA4mjlqq9dwtY
 U2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpe82lv//osHQsKtRM4t4l6sK1m0Za0PaK0Vr4fdyoY=;
 b=q/faQ58I3dM6hXK2sPq7ytaT1aUNgaqr3WYBak1RuUNu9tWzbf1WJxcEOrgBnOoTjl
 cZpJEP0f77lRy+NSPKivE5SFZHYX5DH4DMDSNoKIrwJ6Nvo6XrrD53nk5XCnnW+EQDrp
 HFVEW48UwPwNXe5/iG27CZscy773eCcJIGHwicSSq7TBTF83j1xNA3Tv+BdjnNrIToys
 eeUVUDbAd1wsDi0hdJQwtEnxIOfP5eWCyZAW17EJGvtyzuWsZqtR6Jph7nPnlArBhlp+
 L//m35QnIob5wsYQ0gS7yhIrMQYTlRZ1LVzFPqXmLmX+xQ96hMqlFQg+Zg4xNpRdbCYE
 G56g==
X-Gm-Message-State: AOAM530Qp1P4QE4q3wwW6ZCXDi0RBKJUQC6AkfxxK8Hcu0T/54kuoqBC
 rjD2wGbQvkoZtipjhTzXuvizYhk+AFdSntNkGGPKNg==
X-Google-Smtp-Source: ABdhPJyoDnFBQ0DxS/7bfyDq23MPNXl5F8D04PTNhbGczBHBSGWEUQyST6Lcf/chWicZ0gZXa0jjV0jHvUNBqAEjKEY=
X-Received: by 2002:a05:6870:c994:b0:ee:7eba:99 with SMTP id
 hi20-20020a056870c99400b000ee7eba0099mr1928670oab.236.1652250790695; Tue, 10
 May 2022 23:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220510104829.1466968-1-terry_chen@wistron.corp-partner.google.com>
 <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
In-Reply-To: <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
From: Terry Chen <terry_chen@wistron.corp-partner.google.com>
Date: Wed, 11 May 2022 14:33:00 +0800
Message-ID: <CAMmR3bFad5ODKYUCg8Tp8GVk__AdaQHcpLnRmFyAGXu8Wpycog@mail.gmail.com>
Subject: Re: [PATCH] [v2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, casey.g.bowman@intel.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 liam.r.girdwood@linux.intel.com, Mac Chiang <mac.chiang@intel.com>,
 broonie@kernel.org, Sean Paul <seanpaul@chromium.org>,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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

Hi Pierre-Louis

> @@ -522,6 +578,14 @@ static struct snd_soc_dai_link
*sof_card_dai_links_create(struct device *dev,
>                               goto devm_err;
>                       }
>                       break;
> +             case LINK_BT:
> +                     ret = create_bt_offload_dai_links(dev, links, cpus,
&id, ssp_bt);
> +                     if (ret < 0) {
> +                             dev_err(dev, "fail to create bt offload dai
links, ret %d\n",
> +                                     ret);

For this point, we just follow Intel member to write for this coding style.
The other component also was the same style.



> > @@ -384,6 +384,14 @@ struct snd_soc_acpi_mach
> snd_soc_acpi_intel_adl_machines[] = {
> >               .sof_fw_filename = "sof-adl.ri",
> >               .sof_tplg_filename = "sof-adl-cs35l41.tplg",
> >       },
> > +     {
> > +             .id = "10134242",
> > +             .drv_name = "adl_mx98360a_cs4242",
> > +             .machine_quirk = snd_soc_acpi_codec_list,
> > +             .quirk_data = &adl_max98360a_amp,
> > +             .sof_fw_filename = "sof-adl.ri",
>
> This  also was the same style with others.
>
> > +             .sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
>
> Why would you refer to a topology that uses a different codec?
>

 Because Intel college use the same naming style for the same audio codec.
