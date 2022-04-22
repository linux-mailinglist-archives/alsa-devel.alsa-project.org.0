Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B249150BC0A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 17:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5239415F2;
	Fri, 22 Apr 2022 17:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5239415F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650642442;
	bh=GU4A5VQb0kzN2bEyNAsx5NbpADOzhN1I+jImEYcfX1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxWdATeuXQprPY57JrA2hI3jO2pIPTuZcKCOQuGa+ImRj7htardW8vjUHXsfh5zGg
	 +ERQXM3Ba9iMeuMv909QzVUClZMfxREqmL7AtPSLmeN+MffTj/6mp5DtRineyf6kXx
	 pkML/c9fhRngC2ZF7pt1BiykwDow2FJwaHR62pVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B410FF80125;
	Fri, 22 Apr 2022 17:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695B3F80245; Fri, 22 Apr 2022 17:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE5FF80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 17:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE5FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mxp/FIC7"
Received: by mail-ed1-x529.google.com with SMTP id d6so5820599ede.8
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GU4A5VQb0kzN2bEyNAsx5NbpADOzhN1I+jImEYcfX1w=;
 b=Mxp/FIC7QJGBqWy6pf9urSY4P1j9dmk9WABe+36kK6H6Q/N6AKhiry7+hcd8VNJIBT
 YpCJPxrBd1k8jw8AJz1IlpeY3zsqSQIHpRCyN/1ffJUVjnW9/QaeyV4WmcwO1iY/935W
 P+4bN0m5Zf/SRVP01m0ENXOmO2xAS9YkkzUvylzpRUbROv+nIcZYtyZwxpNgtxX4x4OL
 54lQI2+69TUwYIB0owCa8jcr+30xxrKYDk6lGu9PXsCBPfUJChFW0o/BDV7cMvm2IIg+
 bBkCUDw+ZkvXVzNurlT0ofhyIvoEXruJCAoi/AcQ1z37+/79LkgqirvWSx6fzDTJy/hq
 D78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GU4A5VQb0kzN2bEyNAsx5NbpADOzhN1I+jImEYcfX1w=;
 b=MASPUXK8QvPb6sdmsmTXNebc0/D+o2An1zWFEvD3QoYR1la+u7wQ4AhkHikl595IS0
 GJDhDNQ7IZsHhiVUtUbLqJBTZqv6MOwB8TmnJuMD6WzAv9SjxH6sKY1CUZyMiWkOFS80
 1eje/MdQesJc+yWWMJfaJiSDoYRPYyTDDURtWTRbVyOCzFK/YdU+0zXg+r3Xr6UXD1XX
 XDYkAYhlBJ+iMr9IFpe02qwvnIgADoJt5qiucnHa9l8Enm970Q7JKhV/IO28yMVxKfBL
 2PcuaEPyFZrvUtVEqmzH1B6tOffTD8HYnPTMwwY41v4EheuG5l/aFNyv13gupfzwh1Sf
 11Yg==
X-Gm-Message-State: AOAM533kCfzIPkNB/g8In55PhOt9KW8JFyxVNGtNyDrRijJpE82E4TOw
 kddfmX7NSv6SUgZJpCX7OjD5iKbLlElsMvv+uLXt+tF1
X-Google-Smtp-Source: ABdhPJxhCQNuhdYrYhO6qtukr/WsQu2vLTpWEui4A2uyZgl69wyMB5WWK2H7YV9pqhkywU1gS8OaLYijAXltDBQltxs=
X-Received: by 2002:a05:6402:11ce:b0:423:e2bf:cd4b with SMTP id
 j14-20020a05640211ce00b00423e2bfcd4bmr5637826edw.50.1650642371314; Fri, 22
 Apr 2022 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220422132125.1595729-1-festevam@gmail.com>
 <20220422154323.GS38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220422154323.GS38351@ediswmail.ad.cirrus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Apr 2022 12:46:00 -0300
Message-ID: <CAOMZO5A7xAQ=QoK2Y7RTBL1mi=_wUJxBWn1b5NVhwEsVeVd3Ag@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8524: remove constraint for FE-BE
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@denx.de>,
 patches@opensource.cirrus.com, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Mark Brown <broonie@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

Hi Charles,

On Fri, Apr 22, 2022 at 12:43 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> There was some previous discussion of this patch here:
>
> https://patchwork.kernel.org/project/alsa-devel/patch/1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com/

Thanks for pointing this out. I was not aware of it.
