Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBD6B515A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 21:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DEA1838;
	Fri, 10 Mar 2023 21:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DEA1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678478540;
	bh=cW+lp9YTJ1o16gqh2XsC17m84CPWzfPMKAKxeGvL4vU=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=mYUj6jqQJFUYrgWwk2/1nZR8o1gktGd7FXWOKwjGFKu+AcLMJwAuhtZzJzY7/h+vc
	 B+OFOouxNvFW8K00Qu4LfwooVeNxgNYAV8evBs3aA9zgTFz/DSJurM1I5nU95ZXMPW
	 QxWWy1VzQCd/oHGzMd6+oGrHSVPC0z3lu8hT9j1I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80525F80236;
	Fri, 10 Mar 2023 21:01:29 +0100 (CET)
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
In-Reply-To: <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
Date: Sat, 11 Mar 2023 04:01:03 +0800
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2S5OFJ4FVZTKHMG567LHWFKOPOE6AOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167847848862.26.603819994208932625@mailman-core.alsa-project.org>
From: Ajye Huang via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C561F8042F; Fri, 10 Mar 2023 21:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42DC2F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 21:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DC2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=LAaS3pGI
Received: by mail-yb1-xb32.google.com with SMTP id z83so2498027ybb.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 12:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678478474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0d1xsr+DN56cc9eqodWxWKDt8Iv1tRk/OI0c43Ndtg=;
        b=LAaS3pGI1Osaw4DtM3xeC30oH8sKranbYZeTuX8Vzg49M1/mogrhIPfN2T0wDRdeeE
         5xXqWispLmk8ataNHf89gxmqI1sRX90bKlCMDkQ2rQuuRZZVIjkRXT7wuexDjrnlzxOp
         SL5Ml0goazrs5/ZxLvoGhlAzOQKWoNmxzP6wCtgJE/SJWvkluD2j+q5vKMNd6Ds4/8kV
         lHg/ZptYboP8N1F6NUu1GyUuTFBQlZq+edJNQNiutMdBmaSTndrAgaqshELwMh/yT/Ym
         4XY4QVmbeXeGdC96syMjBHY+EN1FojDTRGonTCLATsANiI3gsl5/7t4egfdmjQb+kfA5
         yWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678478474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0d1xsr+DN56cc9eqodWxWKDt8Iv1tRk/OI0c43Ndtg=;
        b=YUeVsmB8xp5FGdpWeE+EXvD+P51P8qbBtbPVY55ep4Qft+69SMLmmteNUbHQ+u7ydG
         Idol1aPfQtfELZTHAcKyENxEyuBsrhcKhIeznBP+UOSSJtvyc8hTMDGQaCgQz95j6Ok3
         aMU31YdxoFPOAF9Zk52wy/FObnQ4Traoy8rjL2vhTgafV2sU+0tV0jbQlzJqdVmPcb7a
         nWbbAuwp23I9Oia46ES36vqELLLNwycmV9O6F63WHZ1ad3CyM3AJK3o1ujHg6iacB86r
         37nkDXYfaLeSoKkLFwmFAoP7nBuCRYC/1TpGljV9PrLOLcU2UIAJKTQh36d7YFgOi5wL
         aVew==
X-Gm-Message-State: AO0yUKUQYgy7wtLvLdudU0nl/ZNVmRTEB/23i4oBaekeoa1ZXQlv/+7z
	IoeHrYOtE/l2UiUA5kZvnuLu5QAe0HydP/WUVpcEEA==
X-Google-Smtp-Source: 
 AK7set8PzWChg34BeGJ/K5IA6aQA2R2lLiu+Zi+vILRV/LYxe7V78GhtoR7rdp12bBuHtALcNwqoV++zKjgV3CrYDl4=
X-Received: by 2002:a05:6902:4c3:b0:a6a:3356:6561 with SMTP id
 v3-20020a05690204c300b00a6a33566561mr13400434ybs.1.1678478473984; Fri, 10 Mar
 2023 12:01:13 -0800 (PST)
MIME-Version: 1.0
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
In-Reply-To: <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 11 Mar 2023 04:01:03 +0800
Message-ID: 
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: B2S5OFJ4FVZTKHMG567LHWFKOPOE6AOR
X-Message-ID-Hash: B2S5OFJ4FVZTKHMG567LHWFKOPOE6AOR
X-MailFrom: ajye_huang@compal.corp-partner.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2S5OFJ4FVZTKHMG567LHWFKOPOE6AOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 11, 2023 at 2:48=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> This sounds good, but if the intent is to have BT offload enabled across
> all ADL skews there are still misses, e.g.
>
> .name =3D "adl_mx98357_rt5682",
>
> Can we please try to add this BT offload in a more consistent manner, or
> add a comment when this is officially not planned/supported?

Hi Pierre,

The "sof-adl-rt1019-rt5682.tplg" for this "adl_rt1019_rt5682" sound
card also need to enable bt_offload, this one I will submit to SOF
later this weekend.
ex, topology: sof-adl-rt1019-rt5682: add bluetooth offload uses SSP2
link -- https://github.com/ajye-huang/sof/commit/09dcbc3cc1617df652944299c6=
3082f1936dea6e

To be more clear, I think we can add a comment in the commit message
for mention " The related "sof-adl-rt1019-rt5682.tplg" enabled the
bt_offload feature", is it ok?
