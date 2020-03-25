Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FC1930E6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 20:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA371683;
	Wed, 25 Mar 2020 20:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA371683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585163394;
	bh=p/vheuZl9gGfHCw9SstfNz5RMQQnLIRdSoV7LwV/imU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYYHgi7zVgxxRjcJEnBbcJj4HPWHWd56lq8QAzK6Tx8lh6y4sIBP/ljMCqThQdz9t
	 7bzuJXNH4FhZfCB81/LLw1rlGTPYaXNnetR80QIuVkC8aHrnAW+yyShQY5hhcd2iRc
	 7Xg9R/n6fv0079RgUUDFltxyv1ZtC5AJDzF4vvb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 694D3F8015A;
	Wed, 25 Mar 2020 20:08:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F4FF80158; Wed, 25 Mar 2020 20:08:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BE2BF8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 20:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE2BF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XFGtMQ2B"
Received: by mail-qt1-x844.google.com with SMTP id a5so3165439qtw.10
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/vheuZl9gGfHCw9SstfNz5RMQQnLIRdSoV7LwV/imU=;
 b=XFGtMQ2BtzzuNTBVww0gjNX6JRdels2dk93+NBqFekaMBxGmnCY01XADZ4rC2lHOXM
 7zNvjaxix2h3jWGjUOfm3K6stikrQgsBDukxDhk6HpnmZO8JgV6UwA8DpmLNDHKWvqBx
 SWpLv7zijmZ8NSeFOplrfiIcWr7PojxHWwdpT/fFVFA+r1w0FvdNAavoeCri1hN8moEr
 kse47MdUbNbZZXuYdTreSIAP950z3x/7hwcZrPYMfSxAjBkv56zBKtFJLFkU063iMXDi
 JZgcyTkRuajQH9Ya0QOLZ5BRdrVocjSYxnoB25eNCQnTaWk2DRXi1AK0HrPIH3BU22G1
 BGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/vheuZl9gGfHCw9SstfNz5RMQQnLIRdSoV7LwV/imU=;
 b=UZyU84cXqZ/zic+rbuZatqUYOG5zS6gAIaCAbyMLtVlv7otR8xciDkzuGW9Zdyp+YF
 huVU6xdIhLEv29tOD40MiAk1evTgHqblb7DisvFNzRs/oNBP1W7NmXj3RTiAtPixliGs
 VD/ikS0pLIN+gIAPKHqFbt9evMCQ+VARBsyZUZDO/ux4iSFvxROYZIhCfqD2pZlC/VTi
 652+fy4tpHaNr0KQ2yjU2y83YmTVWSHxjipKwoTSsX5bs25YNaH/bkJXcEd+9Wu+PPEb
 gudjbGc3PqPFA5p2tozHAHQzE8BmTM+51x4ufzud9yYIiZ0HmumKn73ogM7Xcjdi0BsV
 jJQA==
X-Gm-Message-State: ANhLgQ3cGrejA7/oLdKq3C93KaFMBWGlacOr0kNglChT1/YitZD/Vr67
 qcAKRqSzi6A2ZvGVrS4Uid/EdcC79dJ+aI4wTWgSRA==
X-Google-Smtp-Source: ADFU+vtIB2xGt1dP6WhAiuZ/RzzJ6eAxhy5kpiDw+5rowEmoriZSTrld7r8hR5Ok6Gcz+muRSrhb5ezayNs/bQ1w4ms=
X-Received: by 2002:ac8:10f:: with SMTP id e15mr4644092qtg.355.1585163284372; 
 Wed, 25 Mar 2020 12:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200319211204.21580-1-cezary.rojewski@intel.com>
In-Reply-To: <20200319211204.21580-1-cezary.rojewski@intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 25 Mar 2020 12:07:52 -0700
Message-ID: <CAOReqxjfqkdy6Z-LGwa3O6ooOpTEdqOWU5nvr8KwG78uebioNw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: broadwell: Revert SSP0 link to use dummy
 components
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Thu, Mar 19, 2020 at 2:13 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Commit:
> "ASoC: Intel: broadwell: change cpu_dai and platform components for SOF
Where does this quote end?
>
> while enabling bdw on SOF, changed behavior for non-SOF solutions. In
> essence replacing platform 'dummy' with actual 'platform' causes
