Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCA1CB1A8
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 16:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5261861;
	Fri,  8 May 2020 16:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5261861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588947806;
	bh=q7BFc7khny71hhq3GM3vWfbL0yPeBXM2+3dXhEGhZdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Me/kK9AppwlAAWdSyFpIBhh2tUKIZkDqyZOJcX5PUzKN+69XEwSPyfmQoaERhjiaJ
	 RR7X9SO2RojNnCs/OEQCv8etF8Is/3w4VIwwpgRQwqQ8SNiHL3ouE2XGp/ojU/UNqx
	 Zh3eV3jXLhqqTH3xLC+/XTqvkMMijmvw94dpQ44c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA7BF800AD;
	Fri,  8 May 2020 16:21:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C7CCF8023E; Fri,  8 May 2020 16:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 288EBF800AD
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 16:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288EBF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="fpYauYeq"
Received: by mail-il1-x142.google.com with SMTP id e8so1539369ilm.7
 for <alsa-devel@alsa-project.org>; Fri, 08 May 2020 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sa2y3Vsz+nSSLviY6v0J1Z5uZej9gf62ErMnBZQNmgc=;
 b=fpYauYeqMsxG1c9KBx3mvZ4WY30g6xzonh5CRRzMyitgtYpfvVnXYFRt/SWssct/dB
 yZ7Nzzf7rskACjYW76Bl+hRNV3VmMiln/EvuuTiuSmBh/60gm67z/o9EHfb6BPvE3EEl
 sUFhvV4JJncAKrYPCOzxVgRyD0oElBcch572SAJNF1TV6sm6g9yOA4/p0+C4KTTYVw8v
 hceyf6qy5SCv43536lzHTkKkGfEbkmQdmxf894Cp1rgpsb58FSSmbHKVJEhyVuyszDy+
 GHCflZiqx69Uvgp37gJAQ4oS8FpR0FD8dJ33wWc+YlpWPiMpl7PvdfvlInLYqsOd2CAY
 MVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sa2y3Vsz+nSSLviY6v0J1Z5uZej9gf62ErMnBZQNmgc=;
 b=ke8h15tRpdLI/mDXfL+UUrstWFYGySpcpTWKWCfYAsRTPKUTCtiiO5cCbpCm59teNk
 0rK/QSNcaxo63uPlemTh0v7rzsmXe0eR+WIFNbTyoSmJRbP1ftYehuqgnKj9BLLJOHnG
 h8MwMsC6J030mwxCY8MKLZJExuV6Fn1nARb/ClEeserrODQIUalEaG2bJAxss53/QWoV
 hCvr9W6xRQ2VQuxLS1ZKUwoVgYRlmbJghb/VHM2B65S/cMsERsq5gmwBlLHq5X6ysxXk
 t08TmPHX9wcWu1WsX5zN5wM9UV99V9HurlojRePAojnz1YEL5A3zVdzUffBqCPNMibgV
 agNQ==
X-Gm-Message-State: AGi0Pubq/9txDwq4PwJj+R8xa9EuJ26pnETIUfxvbIqD3yqlNpie45T8
 97Iu20nwUeZBgnf+LujNdqN3okiG9t+n+5z7i2UDng==
X-Google-Smtp-Source: APiQypK68Y7JBW5h/XyV80owNQq+vD5J11YiWs5xFaln8HLPwuTdMvXcZnWkZdNUdfERvAr7jiy3rcNpoDx0AqYX/hI=
X-Received: by 2002:a92:1d4e:: with SMTP id d75mr3111178ild.235.1588947692733; 
 Fri, 08 May 2020 07:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213405.1869430-1-arnd@arndb.de>
In-Reply-To: <20200507213405.1869430-1-arnd@arndb.de>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 8 May 2020 22:21:21 +0800
Message-ID: <CA+Px+wWPi7bNWm9UaO3K8Lt9n-XxPjVGAD2N9XQYq6KM5DCqRg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: allocate shash_desc dynamically
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, May 8, 2020 at 5:34 AM Arnd Bergmann <arnd@arndb.de> wrote:
> Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

LGTM.  Thanks for the fix.
