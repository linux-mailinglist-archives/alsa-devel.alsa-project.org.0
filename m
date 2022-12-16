Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AF64EE54
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 16:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808A516E6;
	Fri, 16 Dec 2022 16:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808A516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671206296;
	bh=1DGsGWjQ0lY/lk24i4F5eJ6jE9F8/BmfTUTGv89WjOU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l3AqrTI7eGv37GTbIrrnrA6ccWOA8sUowxOB/cY/AIgxGCfh5+a3fh1+e69Q2yQPE
	 N7Mo6KohrY1AooBzs8J/Mm3pnRPLfdq63TT3rpVRFqQ/2Y45LJ/dm6uq2PhjN97sTD
	 VTEoSG/LmxlCiJq5ob4Nb/lWT0NSBmy9gYryZXnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D6CF804CB;
	Fri, 16 Dec 2022 16:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442F8F804E2; Fri, 16 Dec 2022 16:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B1EBF804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 16:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1EBF804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=eYlfeoDL
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-43ea87d0797so10583457b3.5
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1DGsGWjQ0lY/lk24i4F5eJ6jE9F8/BmfTUTGv89WjOU=;
 b=eYlfeoDL1t77ii7tGk4s1m6jM3NBiZzn4Y5SBnG53bj48asOTxITgykqMQ/xZvB3r3
 4CBeyy8duebT6/vX+PIbqh1elpnC6H7IHzG/r5QzZYY55Tz48fd9GLLyDOt0UCOa8jj/
 7uwUdIQKk77jI8eTGYmGFDjzwd+910cdcxBzH5q2f3dVb5LSB9RyMqZQ5ot4c9ICBbba
 xwlFPs9npFsoTpalFmwj770pXORzpe3Dd7dlaosTl3eW+4ZADgB5cJE3CHONb6rK0EWV
 LaM4HZ+fkmDllfBQ1TEx1zQMkBtItezLUdjxksjLJiIZHBJPsaygZharnDmDGxaSwMJr
 7yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1DGsGWjQ0lY/lk24i4F5eJ6jE9F8/BmfTUTGv89WjOU=;
 b=vKvAt+wub133OUBSxgIZ8vj31Zf2Wv0zaZ7aSYE6TYCXtIPiLi2YHuwn76VrYca34l
 2jNqGUtpwOpQqpGZGu+cFXcy22BJeor2RK6XpXW50Cxt/JbjYdAKwPwfK3EbgdHV454j
 LvXLh5I5afkPe1VqybW3sCmAhQva5hJq3q0P1ZuGc8vlfqmXduRdW5HAQcelEmp3jGeo
 Z2Ep7eXUX5SeX9zMKxSfkTTlEssYVHG1/9vVngFueqXsrACOvJ0UtN5Kz2wlaoOjKoRU
 MeQc4NtYDRnhpzHwGp9nkRuCv8t/JHvBuNJijFppYblnNYTKqs12B7t4GeRZ1zPJPM25
 R63g==
X-Gm-Message-State: ANoB5pmf84ZWl1SR2cLCFpri4dP7jEJnE9w7weGN0PBVP6c6rv4DLIbO
 jRxM2OQSQ84nb3UvVlXG78FbOb5RjQh58yLKQ1zjrA==
X-Google-Smtp-Source: AA0mqf7zGwo31RP+2Xxyawt8Dub0IXytMy+goLFzNzvCDBBqB0ZbozYOJp3bY07v0+jktvVL5wk2C+QblJ4aQYv4xOE=
X-Received: by 2002:a81:9a95:0:b0:3f2:6ea8:f435 with SMTP id
 r143-20020a819a95000000b003f26ea8f435mr17498515ywg.277.1671206233242; Fri, 16
 Dec 2022 07:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 16 Dec 2022 23:57:02 +0800
Message-ID: <CALprXBYwNaHCe+EO9G_SvWg2HNVAz62KzaaxGCb1PssJshXUzQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre

On Fri, Dec 16, 2022 at 11:49 PM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:

Based on the suggestions you provided in v1,
> Suggested edit:
>
> ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.
>
> That should be added in the commit message please.
>

The v2 includes:
changes from v1->v2:
* Modify title and add explanations in commit messages .
* Use new topology file "sof-adl-nau8318-nau8825.tplg" instead of
sof-adl-max98360a-nau8825.tplg.

Thanks for your suggestions.
