Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A112F7DFD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37BA17CC;
	Fri, 15 Jan 2021 15:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37BA17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610720411;
	bh=Y+V1BTsabldr8kQaDKKXYhpQT6G4NO4a1QQP2PkFV14=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3FvNf0W0DH3YYai/wVXp0ysrffE3ImdvYSjOS3kcfxvU1zWtBYtKq8RAIlQ69bHS
	 mrmbFiCnxFz+g3oIr/ayB8TmsqOs5okWfue2WtMIopFoNGdepmjKWjzLApyveOSwhl
	 CT58uAqM55FrHo64lMT8dOxOgNnGFuY85ir6tpVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE27FF80254;
	Fri, 15 Jan 2021 15:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F6E5F801ED; Fri, 15 Jan 2021 15:18:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4173EF80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4173EF80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610720306403943062-webhooks-bot@alsa-project.org>
References: <1610720306403943062-webhooks-bot@alsa-project.org>
Subject: Sound stutters with TC-Helicon GoXLR
Message-Id: <20210115141834.4F6E5F801ED@alsa1.perex.cz>
Date: Fri, 15 Jan 2021 15:18:34 +0100 (CET)
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

alsa-project/alsa-lib issue #113 was opened from Toniob:

Hi,

I bought a hardware mixer from TC-Helicon. I mainly use it under windows for streaming. But now, I'm trying to make it work under Linux, which I use for work. The hardware is seen as a multi-inputs multi-outputs soundcard under Linux. I use Debian unstable, Gnome (xwayland) and pulseaudio. It's an usb connected hardware (with its own power).

The sound was stuttering every 3 or 4 seconds. It was plugged on a usb 3.0 port on the motherboard. But then, I bought a pci-express usb 3.0 card and I plugged the goxlr on it. The stutters are steal present but less often (I'd say on every 30 seconds).

I've opened an issue on pulseaudio gitlab but it doesn't seem related to pulse as I've got the issue with alsa only : https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1093 .

I know a person, met on the discord of tc-helicon, who has exactly the same symptoms with another distribution.

Another fun fact is that the inputs do not stutter. I can record my mic plugged in the goxlr and it never stutters.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/113
Repository URL: https://github.com/alsa-project/alsa-lib
