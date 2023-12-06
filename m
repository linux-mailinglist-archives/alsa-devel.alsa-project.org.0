Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBB80777E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 19:22:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F352E868;
	Wed,  6 Dec 2023 19:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F352E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701886934;
	bh=v3PqzpMJDObFc7GsdpIP39YrHiv00jfJeSZRlf8dlAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IOXNm94nMREb4i6mMmo5zuG1eCN1/RLRX+fu/V0aaENso6EZwrdFmZAnNIjk1rE8h
	 GTRiIlYJZ/t2OmcP5KLTydLESQ/tszViyM+qwvqblQeJ3FjzG1K8ZNJv4coLrkqQL0
	 7kRaarNRRgKnufnbkiURGCb1urY5OI5F5KdQ/V9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AA6F8056F; Wed,  6 Dec 2023 19:21:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85578F8057A;
	Wed,  6 Dec 2023 19:21:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E34F8024E; Wed,  6 Dec 2023 19:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F267F800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 19:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F267F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=rc3vsG83
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c6839373f8so91257a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Dec 2023 10:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701886885; x=1702491685;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3PqzpMJDObFc7GsdpIP39YrHiv00jfJeSZRlf8dlAc=;
        b=rc3vsG83iUKtoN0aDf5hSW2YmYMSMQa0QoaCK02WKy5kRGe/OshQdWpRLSBbJ47w+h
         onNtoWOv3Cbe2iYHVE8JkjXY1qArf5cB4ujTLJ7gq2hsy3k20iymlAYTadiLjC+eykQY
         jzwn48fiTQO1P2fwT6xW4mXNDXtfRPA+z3g8XWhjAvqHU1nlmzoXxjrT6YDtz9cdU0EP
         urrDW/Dh0DAUp8JTfDwKWGy0k2uDKYeam7VfsHGydMlPrUXzwrCP4aG+ufkaWRJSRZQP
         6/lGqbSmMZa9pR772ZZIsOy6Y8biUdumS4QaMJriDO386aH2+wJNygECpZGHrR5QLRKP
         grZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701886885; x=1702491685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3PqzpMJDObFc7GsdpIP39YrHiv00jfJeSZRlf8dlAc=;
        b=KswwlXo8XUGJp0MkjnP0zxjTMll0VxE6g2jgJHgEFUqIOEjJtA5pFqDEn7VAivQqQ/
         qY9r11D1H+wvyWu1pTqkf+5/FKKu5pd4Yhb2s/1sPMb90gt9VUJGINTwZvnC51SDygIB
         1eBHgoXWV26ua+pFWEBOe1aHQMVW6DwHv2KqMdkhs61v77BiFdzTFu74eFmsLBce54l2
         aRvApqxa06vpHT5dHlbe+xhwMfbpzXF+MkID/ggsAYJdfVJ3CTu1E0/ug+RrAYLlJGtG
         LK2hAAocvyxAbs9Qooopuie2h+NZ7UPMceuPkGQ7udHwMyh8oAkwQIOSNv9ZSRuyDLS4
         v2gQ==
X-Gm-Message-State: AOJu0YzgeMeRCdObY9Jf5ciOXlMP6akADUjNp3ID3Qm6w9Ihs8YjZb1A
	7WMQf8mtbWsJQ/Pz8SCgArHcY9mIaDqoCV0COWAlBQ==
X-Google-Smtp-Source: 
 AGHT+IG8g3uSzPplvdnGVtayOw+83g6nqpGdp4GjKie3nwEd4g42HMxSrKms59UnyGIxhfeDVx8kjKIf1SnmD2Y+/pk=
X-Received: by 2002:a17:90b:38c5:b0:285:8cb6:6153 with SMTP id
 nn5-20020a17090b38c500b002858cb66153mr1833162pjb.17.1701886885017; Wed, 06
 Dec 2023 10:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20231205220131.2585913-1-cujomalainey@chromium.org>
 <b441c416-91aa-4723-a605-a58974dcc444@collabora.com>
In-Reply-To: <b441c416-91aa-4723-a605-a58974dcc444@collabora.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 6 Dec 2023 10:21:13 -0800
Message-ID: 
 <CAOReqxin1gbzwZPrJokue5WRZS1nU-R38+2K9k1tWeb0Y0mZyA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6T45SEOATUTXTL4AHWVBFUJTTODBXT33
X-Message-ID-Hash: 6T45SEOATUTXTL4AHWVBFUJTTODBXT33
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6T45SEOATUTXTL4AHWVBFUJTTODBXT33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 6, 2023 at 6:32=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/12/23 23:01, cujomalainey@chromium.org ha scritto:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.
> >
> > This is not an official topology from the SOF project. Topologies are
> > named based on the card configuration and are NOT board specific.
> >
>
> While I can totally agree with that, can you please explain how should th=
e correct
> topology file name be selected instead of machine compatibles?
>
> Thanks,
> Angelo

The typical convention is if there is more than one configuration with
an SoC to suffix with the components involved. Additional suffixes can
be added for special cases e.g. for Intel
sof-tgl-rt5682-max98357a.tplg where tgl is the SoC family, rt5682 is
the codec and max98357a is the amp. You can find examples where the
pin mapping was changed accidentally on some boards so you will see
suffixes like "-up4". Public suffixes/topologies do not include 3P
blocks.

Curtis

>
