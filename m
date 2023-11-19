Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4C7F0826
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Nov 2023 18:37:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447649F6;
	Sun, 19 Nov 2023 18:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447649F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700415428;
	bh=Y52/lC2kRzj0/SAS4yeuDah5TX5BAeartY/J5t03ilo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R/LhkPiJ2vr51ezB/OXjq1YUj5MPu7n9p4nay2Re4g7V0y0yzMITSUMVzqnQSsNkZ
	 nxcHq/+Iivz8KIFPRuL3LCF+MzptsDrfpsLZWSdDQEgXjRuLfErxGmTgnVB+uMZ1Sf
	 /Ia4r71+UUPodai8A0hfKWwsr8gVbmvfiyW8does=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C3A4F80254; Sun, 19 Nov 2023 18:36:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4190DF80249;
	Sun, 19 Nov 2023 18:36:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF0F8F80254; Sun, 19 Nov 2023 18:35:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21721F80246
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 18:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21721F80246
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3036E6144362; Mon, 20 Nov 2023 04:05:27 +1030 (ACDT)
Date: Mon, 20 Nov 2023 04:05:27 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH RFC v2] ALSA: scarlett2: Add ioctls for user-space access
Message-ID: <ZVpHX33vfzdjpH0z@m.b4.vu>
References: <ZSqehHhedJQY9h/1@m.b4.vu>
 <76c1526d-78be-92d2-cf2b-148278394575@perex.cz>
 <ZS0tajzKr68CZ5uA@m.b4.vu>
 <123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
 <ZS1asqF0cXRUzBwb@m.b4.vu>
 <87edhtn0r2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edhtn0r2.wl-tiwai@suse.de>
Message-ID-Hash: KEQZDG6CFB6NLMZ3XB7P2SMHQGQHN2X5
X-Message-ID-Hash: KEQZDG6CFB6NLMZ3XB7P2SMHQGQHN2X5
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEQZDG6CFB6NLMZ3XB7P2SMHQGQHN2X5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav, Takashi,

I took your feedback onboard about not providing generic access to the
scarlett2_usb() function from user-space.

After a few iterations, I've come up with this hwdep interface to
support reset-to-factory-defaults, reset-to-factory-firmware, and
firmware-update in a safe way:

-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----

/* Get protocol version */
#define SCARLETT2_IOCTL_PVERSION _IOR('S', 0x60, int)

/* Reboot */
#define SCARLETT2_IOCTL_REBOOT _IO('S', 0x61)

/* Select flash segment */
#define SCARLETT2_SEGMENT_ID_SETTINGS 0
#define SCARLETT2_SEGMENT_ID_FIRMWARE 1
#define SCARLETT2_SEGMENT_ID_COUNT 2

#define SCARLETT2_IOCTL_SELECT_FLASH_SEGMENT _IOW('S', 0x62, int)

/* Erase selected flash segment */
#define SCARLETT2_IOCTL_ERASE_FLASH_SEGMENT _IO('S', 0x63)

/* Get selected flash segment erase progress
 * 1 through to num_blocks, or 255 for complete
 */
struct scarlett2_flash_segment_erase_progress {
        unsigned char progress;
        unsigned char num_blocks;
};
#define SCARLETT2_IOCTL_GET_ERASE_PROGRESS \
        _IOR('S', 0x64, struct scarlett2_flash_segment_erase_progress)

-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----

Does that look reasonable to you?

Broadly, it's used like this:

Reset to factory default configuration:

- ioctl select_flash_segment SCARLETT2_SEGMENT_ID_SETTINGS
- ioctl erase_flash_segment
- ioctl get_erase_progress (optional)

Erase firmware (reverts to factory firmware which is stored in a
different flash segment, inaccessible from these ioctls):

- ioctl select_flash_segment SCARLETT2_SEGMENT_ID_FIRMWARE
- ioctl erase_flash_segment
- ioctl get_erase_progress (optional)

Upload new firmware:

- write() <- a bunch of these, only permitted after the previous erase
  step was completed

On completion:

- ioctl reboot

To confirm that this interface is sufficient, I have implemented it in
the scarlett2 driver and written a user-space utility which can
perform all the above operations.

I will clean up the implementation a bit and then submit for review;
just wanted to share the interface first in case you have any comments
at this point.

Thanks,
Geoffrey.
