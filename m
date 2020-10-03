Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFA2822EE
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01E5B18FD;
	Sat,  3 Oct 2020 11:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01E5B18FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601716282;
	bh=Lis1UA7evOjm7bj9t1+4kqOmMH5ClghWGtsEc9Jpi0Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrbrT336/HpqYvv2T+zcm6uN3xF6ZoMC01OCDMXP5yL9FXtSz+rvh3ReH+em8oe+e
	 D4jMVHlKDcFm55xw+HX7z5qsCkbPgselFB9T1sDSY0IfN9s2z2ff4GScL38Ap5vlQd
	 f9yKutv1gwvhLd1ph7bnANbYwksX11bIDeUKoQQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 253C6F802FF;
	Sat,  3 Oct 2020 11:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E6FF801F5; Sat,  3 Oct 2020 11:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0710F800BB
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0710F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KVzsukWH"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8BE4206F8;
 Sat,  3 Oct 2020 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601715896;
 bh=Lis1UA7evOjm7bj9t1+4kqOmMH5ClghWGtsEc9Jpi0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KVzsukWHXL/c7SXWnZp/QRL7nS9XxxcbR2/JjOr45weKpTJfvY71zKb/pFzxEOttn
 TqJDKNCX0Ye0aZg/HP+fM8Ew/4pEzF9p1MeaepR46SjJDODP+MJ2GXGSCajI2vz/Oz
 JZvPTSvVbDYUjBbMd6Qmcl6QdZG4P9lAxd7R4M7A=
Date: Sat, 3 Oct 2020 12:04:52 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Dave Ertman <david.m.ertman@intel.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201003090452.GF3094@unreal>
References: <20201001050534.890666-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201001050534.890666-1-david.m.ertman@intel.com>
X-Mailman-Approved-At: Sat, 03 Oct 2020 11:06:14 +0200
Cc: linux-rdma@vger.kernel.org, linux-netdev <netdev@vger.kernel.org>,
 alsa-devel@alsa-project.org
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

Hi Dave,

I don't know why did you send this series separately to every mailing
list, but it is not correct thing to do.

RDMA ML and discussion:
https://lore.kernel.org/linux-rdma/20201001050534.890666-1-david.m.ertman@intel.com/T/#t
Netdev ML (completely separated):
https://lore.kernel.org/netdev/20201001050851.890722-1-david.m.ertman@intel.com/
Alsa ML (separated too):
https://lore.kernel.org/alsa-devel/20200930225051.889607-1-david.m.ertman@intel.com/

Thanks

On Wed, Sep 30, 2020 at 10:05:28PM -0700, Dave Ertman wrote:
> Brief history of Ancillary Bus
> ==============================
> The ancillary bus code was originally submitted upstream as virtual
> bus, and was submitted through the netdev tree.  This process generated
> up to v4.  This discussion can be found here:
>  https://lore.kernel.org/netdev/0200520070227.3392100-2-jeffrey.t.kirsher@intel.com/T/#u
>
> At this point, GregKH requested that we take the review and revision
> process to an internal mailing list and garner the buy-in of a respected
> kernel contributor.
>
> The ancillary bus (then known as virtual bus) was originally submitted
> along with implementation code for the ice driver and irdma drive,
> causing the complication of also having dependencies in the rdma tree.
> This new submission is utilizing an ancillary bus consumer in only the
> sound driver tree to create the initial implementation and a single
> user.
>
> Since implementation work has started on this patch set, there have been
> multiple inquiries about the time frame of its completion.  It appears
> that there will be numerous consumers of this functionality.
>
> The process of internal review and implementation using the sound
> drivers generated 19 internal versions.  The changes, including the name
> change from virtual bus to ancillary bus, from these versions can be
> summarized as the following:
>
> - Fixed compilation and checkpatch errors
> - Improved documentation to address the motivation for virtual bus.
> - Renamed virtual bus to ancillary bus
> - increased maximum device name size
> - Correct order in Kconfig and Makefile
> - removed the mid-layer adev->release layer for device unregister
> - pushed adev->id management to parent driver
> - all error paths out of ancillary_device_register return error code
> - all error paths out of ancillary_device_register use put_device
> - added adev->name element
> - modname in register cannot be NULL
> - added KBUILD_MODNAME as prefix for match_name
> - push adev->id responsibility to registering driver
> - uevent now parses adev->dev name
> - match_id function now parses adev->dev name
> - changed drivers probe function to also take an ancillary_device_id param
> - split ancillary_device_register into device_initialize and device_add
> - adjusted what is done in device_initialize and device_add
> - change adev to ancildev and adrv to ancildrv
> - change adev to ancildev in documentation
>
> This submission is the first time that this patch set will be sent to
> the alsa-devel mailing list, so it is currently being submitted as
> version 1.
>
> ==========================
>
> Introduces the ancillary bus implementation along with the example usage
> in the Sound Open Firmware(SOF) audio driver.
>
> In some subsystems, the functionality of the core device
> (PCI/ACPI/other) may be too complex for a single device to be managed as
> a monolithic block or a part of the functionality might need to be
> exposed to a different subsystem.  Splitting the functionality into
> smaller orthogonal devices makes it easier to manage data, power
> management and domain-specific communication with the hardware.  Also,
> common ancillary_device functionality across primary devices can be
> handled by a common ancillary_device. A key requirement for such a split
> is that there is no dependency on a physical bus, device, register
> accesses or regmap support. These individual devices split from the core
> cannot live on the platform bus as they are not physical devices that
> are controlled by DT/ACPI. The same argument applies for not using MFD
> in this scenario as it relies on individual function devices being
> physical devices that are DT enumerated.
>
> An example for this kind of requirement is the audio subsystem where a
> single IP handles multiple entities such as HDMI, Soundwire, local
> devices such as mics/speakers etc. The split for the core's
> functionality can be arbitrary or be defined by the DSP firmware
> topology and include hooks for test/debug. This allows for the audio
> core device to be minimal and tightly coupled with handling the
> hardware-specific logic and communication.
>
> The ancillary bus is intended to be minimal, generic and avoid
> domain-specific assumptions. Each ancillary bus device represents a part
> of its parent functionality. The generic behavior can be extended and
> specialized as needed by encapsulating an ancillary bus device within
> other domain-specific structures and the use of .ops callbacks.
>
> The SOF driver adopts the ancillary bus for implementing the
> multi-client support. A client in the context of the SOF driver
> represents a part of the core device's functionality. It is not a
> physical device but rather an ancillary device that needs to communicate
> with the DSP via IPCs. With multi-client support,the sound card can be
> separated into multiple orthogonal ancillary devices for local devices
> (mic/speakers etc), HDMI, sensing, probes, debug etc.  In this series,
> we demonstrate the usage of the ancillary bus with the help of the IPC
> test client which is used for testing the serialization of IPCs when
> multiple clients talk to the DSP at the same time.
>
> Dave Ertman (1):
>   Add ancillary bus support
>
> Fred Oh (1):
>   ASoC: SOF: debug: Remove IPC flood test support in SOF core
>
> Ranjani Sridharan (4):
>   ASoC: SOF: Introduce descriptors for SOF client
>   ASoC: SOF: Create client driver for IPC test
>   ASoC: SOF: ops: Add ops for client registration
>   ASoC: SOF: Intel: Define ops for client registration
>
>  Documentation/driver-api/ancillary_bus.rst | 230 +++++++++++++++
>  Documentation/driver-api/index.rst         |   1 +
>  drivers/bus/Kconfig                        |   3 +
>  drivers/bus/Makefile                       |   3 +
>  drivers/bus/ancillary.c                    | 191 +++++++++++++
>  include/linux/ancillary_bus.h              |  58 ++++
>  include/linux/mod_devicetable.h            |   8 +
>  scripts/mod/devicetable-offsets.c          |   3 +
>  scripts/mod/file2alias.c                   |   8 +
>  sound/soc/sof/Kconfig                      |  29 +-
>  sound/soc/sof/Makefile                     |   7 +
>  sound/soc/sof/core.c                       |  12 +
>  sound/soc/sof/debug.c                      | 230 ---------------
>  sound/soc/sof/intel/Kconfig                |   9 +
>  sound/soc/sof/intel/Makefile               |   3 +
>  sound/soc/sof/intel/apl.c                  |  18 ++
>  sound/soc/sof/intel/bdw.c                  |  18 ++
>  sound/soc/sof/intel/byt.c                  |  22 ++
>  sound/soc/sof/intel/cnl.c                  |  18 ++
>  sound/soc/sof/intel/intel-client.c         |  49 ++++
>  sound/soc/sof/intel/intel-client.h         |  26 ++
>  sound/soc/sof/ops.h                        |  14 +
>  sound/soc/sof/sof-client.c                 | 117 ++++++++
>  sound/soc/sof/sof-client.h                 |  65 +++++
>  sound/soc/sof/sof-ipc-test-client.c        | 314 +++++++++++++++++++++
>  sound/soc/sof/sof-priv.h                   |  16 +-
>  26 files changed, 1233 insertions(+), 239 deletions(-)
>  create mode 100644 Documentation/driver-api/ancillary_bus.rst
>  create mode 100644 drivers/bus/ancillary.c
>  create mode 100644 include/linux/ancillary_bus.h
>  create mode 100644 sound/soc/sof/intel/intel-client.c
>  create mode 100644 sound/soc/sof/intel/intel-client.h
>  create mode 100644 sound/soc/sof/sof-client.c
>  create mode 100644 sound/soc/sof/sof-client.h
>  create mode 100644 sound/soc/sof/sof-ipc-test-client.c
>
> --
> 2.26.2
>
