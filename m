Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DF36876F6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 09:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6941ED;
	Thu,  2 Feb 2023 09:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6941ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675325129;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=thcQbaBe5w+gyrwDWAf7q/asrcrO198hQ/FjLpQBMxmta4H7Yaj6UMkRhknHf5QhM
	 1TTxjKgiDC6OSvlKSHHwj4/lXeFBPj0YX1hoNPTzu9IuFakNU0JR2E/jXX5CdyTwCg
	 PvlWvG3op2JUmBty4b53fg3kDmPr0QhZ9D0kZ+y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBB2F80169;
	Thu,  2 Feb 2023 09:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18396F804C2; Thu,  2 Feb 2023 09:04:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_DNSWL_LOW,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3705F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 09:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3705F800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pPGg32WN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675325057; bh=rA0klT10ET2TVy5IObA0A73rTA7tqVFYRzEWInyllkY=;
 h=X-UI-Sender-Class:Date:Subject:From:To;
 b=pPGg32WNnjVoYlnHw05Tu4w8Pr+KNs+Bp+D+Yb31+Fe7sHwyGDQyepiKl6ui2IYgW
 hKkrWRSuFI64zXh2Zcu6IfdGfkvRBAXgtKp2f28Yk4fEkfAq54IMYEySLmk5NgOhI6
 ESCG2cOghU+DgfKsHJEvGRNw2ywXexelYDuy0/DJOaPh9iO6IzqrpRa6NyrS31sN/Q
 uNu9B/24QdJ/P2Vp6afwV2CQxv/Fo+FS5+GvOwPhvsuFxFKcfzjmHiJIYG0UIrsquo
 /7vBfvjmMoUvNnACVPx3DgxB4hW7iObc9QOh2nPVy2cub3rp33SqUKbJFbG1kFEMIQ
 eyTqlB6B32B3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.125.193.179] ([109.42.114.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1oUHWq0wzR-00tSWV for
 <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 09:04:17 +0100
Date: Thu, 02 Feb 2023 09:04:16 +0100
Subject: Test - empty posts
X-Priority: 3
Message-ID: <pt5m08-jwzdatj1sw2m-or7tli-y0mpue-9rlaw452uugk76lg5nemh4thhhljpijopwmjt4ppm4mtjripf207mp-x59dvr-h6n7wt7ojurx6049pp-ikudq0-z1d5udx646wb-df37rg-47bevjschyrm.1675325056453@email.android.com>
From: "M. Armsby" <m.armsby@gmx.de>
To: ALSA mail List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:TcGwOAaHb+d8Kyk6ohrX3oEfJZlzsXtm4f1o32gHD/dXe4LWUbG
 kbp7KPL01cqxpBZ9/f2WKHC4Rlvfr+4bAm8Amg9naGh79FuQNvYxREHOqa0Jsg4HVYxDmov
 /f4FFXSVHHaLFQ01kbI99tm1OwLFgaMBAclo+KvRXVpQiC51PC2zeRFFnoPb2c4cZMr5h3B
 /iVhO40yx3itoL0/JEvhw==
UI-OutboundReport: notjunk:1;M01:P0:rE8uYTS/G3o=;8GpRdS9UwEhLY+Bp6qCG+OGQ5LQ
 s1lFqFCiTmQc3HaWwVQ0RwmIzqOs5A8YVnLJiOdgDXelSlAc6n1ocRAMvubARYxERHGnJFx90
 pxfsIxRn2yBTPfku1oWZR1/bFRN7S06TqLHoQnxqdwQVaVYo2XDhc7wG8A4QwU2zdih0XUEka
 CbG9uWHd5dQ0cI1JgNk5m4J+Xd/ERr1K0kQPRuocJNj3R81NGCmb4xHFnYs7PPIESYDs6a4wH
 zctqyesjHFbBGrrYLyUNOP/+tzoIK8e/6KJLkSXhYcSmjynKoG6havdBFwyNkhr4fmZTw3ikY
 a6NzVk9Et/KIXOGKzyrU2kR4Mp1Cltf1MOUhhJsAXqCNUs/DCr4OPrBzPa2oKG7x8qxvo4ny0
 D3WxZdmay5KpnG+0VjT1QapzU2stxkVVbI9a3ZWNSCytCWtvg+BrKX1qnZHFr5ZxINKu2B3P1
 6c6gXAthbwkKlF407fBaPWoEdbzbGb4LbiVl4+tJDW1ZrgZLylf4hTMLE008gSFaQTcqGpENU
 w6upDxZ16zwbNRj5ISjp0kN0b3jH3eA49xNj6j9jSqpqayYgPpcCSi0RJAnBQtlcsmHswTWrh
 FTj9ZBffiiQGdfV4kwtMLkGBKfzk5DRhCwC6gixXbONUb7/Koj6CUO6759WijQPALwfaRCCXL
 tDstqmtxJkyZZsgwEyzIVa7MyKq4Jz5hKz9o+2O2DC0tnrVnjE0QVoz8Zy0CakE3lVgaa6eIW
 Z5bIopm+cQhfrxhdqZCon9Ij+WTg8y4rEz0mIoKvfJnP2Y8wZHl2R9/lJC3q10pY2rmmz71t+
 7xWYpvjI69JUvTg2BSrz5W8yXYzVcN9LLAGs1jWUPY6zDzUVhD6EF2bb3jXL39hKvKLnxDt0M
 sZwDqN1TyPFE+k+DCWAwXejgi2VjzJ2VL0LULhzQ4q1dvHjkFdljy9zDaT1gdhB25uaSCxQp4
 rqkSUgTs0RUeajjRUBu2CvcXxL4=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

